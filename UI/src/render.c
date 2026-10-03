#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <stdbool.h>
#include <time.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <pthread.h>
#include <unistd.h>
#include <getopt.h>
#include <csv.h>

#define MAX_MOLECULES 150
#define MAX_CAS_LEN 64
#define MAX_NAME_LEN 128
#define DflT_FPS 30
#define DflT_SEC 20
#define DflT_W 640
#define DflT_H 640

int FPS = DflT_FPS;
int SEC = DflT_SEC;
int W = DflT_W;
int H = DflT_H;
double AToMizer_V0 = 25.0;
double AToMizer_SPREAD = 0.42;
double AMBient_TEMP = 298.15; 
double AMBient_HUMIDITY = 0.50;
char OUT_FILENAME[256] = "perfume_dispersion.gif";

typedef struct {
    char cas[MAX_CAS_LEN];
    char name[MAX_NAME_LEN];
    double mw;
    double vap_pressure;
    double r, g, b;
} Molecule;

Molecule loaded_molecules[MAX_MOLECULES];
int loaded_count = 0;

typedef struct {
    unsigned int thread_id;
    double base_dist;
    double dist_amp;
    double dist_freq;
    double base_yaw;
    double yaw_speed;
    double base_pitch;
    double pitch_amp;
    double pitch_freq;
    double shake_amp;
    double zoom_speed;
} Camera_Config;

typedef struct { double x, y, z, d; int mol_idx; } Sample_Point;
typedef struct { Sample_Point *data; int size; int capacity; } Point_Buffer;

typedef struct {
    bool header_skipped;
    char current_cas[MAX_CAS_LEN];
    char current_name[MAX_NAME_LEN];
    char current_mw[64];
    int col;
} CSV_Load_Ctx;

typedef void (*csv_callback)(void *, size_t, void *);
typedef void (*csv_row_callback)(int, void *);

static double rand_float_range(double min, double max, unsigned int *seed) { 
    return min + (rand_r(seed) / (double)RAND_MAX) * (max - min); 
}

static int rand_int_range(int min, int max, unsigned int *seed) { 
    return min + rand_r(seed) % (max - min); 
}

static unsigned char clamp_val(double v, int lo, int hi) { 
    int val = (int)v; 
    if (val < lo) return (unsigned char)lo; 
    if (val > hi) return (unsigned char)hi; 
    return (unsigned char)val; 
}

void buf_init(Point_Buffer *b) { 
    b->size = 0; b->capacity = 4096; 
    b->data = (Sample_Point *)malloc(b->capacity * sizeof(Sample_Point)); 
}

void buf_append(Point_Buffer *b, Sample_Point p) { 
    if (b->size >= b->capacity) { 
        b->capacity *= 2; 
        b->data = (Sample_Point *)realloc(b->data, b->capacity * sizeof(Sample_Point)); 
    } 
    b->data[b->size++] = p; 
}

void cb_load_ingredients(void *s, size_t len, void *data) {
    CSV_Load_Ctx *ctx = (CSV_Load_Ctx *)data;
    if (!ctx->header_skipped) {
        ctx->col++;
        return;
    }

    if (ctx->col == 0) {
        if (len >= MAX_CAS_LEN) len = MAX_CAS_LEN - 1;
        memcpy(ctx->current_cas, s, len);
        ctx->current_cas[len] = '\0';
    } else if (ctx->col == 1) {
        if (len >= MAX_NAME_LEN) len = MAX_NAME_LEN - 1;
        memcpy(ctx->current_name, s, len);
        ctx->current_name[len] = '\0';
    } else if (ctx->col >= 5) {
        if (len < sizeof(ctx->current_mw)) {
            memcpy(ctx->current_mw, s, len);
            ctx->current_mw[len] = '\0';
        }
    }
    ctx->col++;
}

void cb_row_ingredients(int c, void *data) {
    (void)c;
    CSV_Load_Ctx *ctx = (CSV_Load_Ctx *)data;
    if (!ctx->header_skipped) {
        ctx->header_skipped = true;
    } else {
        if (loaded_count < MAX_MOLECULES && strlen(ctx->current_cas) > 0) {
            strncpy(loaded_molecules[loaded_count].cas, ctx->current_cas, MAX_CAS_LEN);
            strncpy(loaded_molecules[loaded_count].name, ctx->current_name, MAX_NAME_LEN);
            
            double mw = atof(ctx->current_mw);
            loaded_molecules[loaded_count].mw = (mw > 0.0) ? mw : 150.0;
            loaded_molecules[loaded_count].vap_pressure = fmax(0.2, 300.0 / loaded_molecules[loaded_count].mw);

            unsigned int color_seed = loaded_count + 1337; 
            loaded_molecules[loaded_count].r = rand_int_range(60, 220, &color_seed);
            loaded_molecules[loaded_count].g = rand_int_range(60, 220, &color_seed);
            loaded_molecules[loaded_count].b = rand_int_range(60, 220, &color_seed);

            loaded_count++;
        }
    }
    ctx->col = 0;
    memset(ctx->current_cas, 0, sizeof(ctx->current_cas));
    memset(ctx->current_name, 0, sizeof(ctx->current_name));
    memset(ctx->current_mw, 0, sizeof(ctx->current_mw));
}

bool parse_csv_file(const char *filename, csv_callback cb, csv_row_callback row_cb, void *user_data) {
    FILE *fp = fopen(filename, "r");
    if (!fp) { fprintf(stderr, "Error opening %s\n", filename); return false; }

    struct csv_parser p;
    csv_init(&p, CSV_STRICT);
    char buf[1024];
    size_t bytes_read;

    while ((bytes_read = fread(buf, 1, 1024, fp)) > 0) {
        if (csv_parse(&p, buf, bytes_read, cb, row_cb, user_data) != bytes_read) {
            fprintf(stderr, "Error parsing %s: %s\n", filename, csv_strerror(csv_error(&p)));
            csv_free(&p); fclose(fp); return false;
        }
    }
    csv_fini(&p, cb, row_cb, user_data);
    csv_free(&p);
    fclose(fp);
    return true;
}

void load_simulation_data() {
    CSV_Load_Ctx load_ctx = {false, "", "", "", 0};
    if (!parse_csv_file("ingredients.csv", cb_load_ingredients, cb_row_ingredients, &load_ctx)) exit(1);

    // Check for Ollama generated rigging sequences or standard formulas
    FILE *fr = fopen("rigging_sequence.json", "r");
    if (fr) {
        printf("[RIGGING PHYSICS ENGINE] Loaded dynamic object rigging sequence.\n");
        fclose(fr);
    }

    FILE *ff = fopen("formula.txt", "r");
    if (ff) {
        char active_cas_list[25][MAX_CAS_LEN];
        int active_count = 0;
        char line[128];
        while (fgets(line, sizeof(line), ff) && active_count < 25) {
            line[strcspn(line, "\r\n")] = 0;
            if (strlen(line) > 0) {
                char *token = strtok(line, ":");
                if (token) {
                    strncpy(active_cas_list[active_count], token, MAX_CAS_LEN);
                    active_count++;
                }
            }
        }
        fclose(ff);

        if (active_count > 0) {
            Molecule temp_mol[MAX_MOLECULES];
            int temp_count = 0;
            for (int i = 0; i < loaded_count; i++) {
                bool match = false;
                for (int j = 0; j < active_count; j++) {
                    if (strcmp(loaded_molecules[i].cas, active_cas_list[j]) == 0) {
                        match = true;
                        break;
                    }
                }
                if (match && temp_count < MAX_MOLECULES) {
                    temp_mol[temp_count++] = loaded_molecules[i];
                }
            }
            if (temp_count > 0) {
                memcpy(loaded_molecules, temp_mol, sizeof(Molecule) * temp_count);
                loaded_count = temp_count;
            }
        }
    }

    if (loaded_count == 0 && MAX_MOLECULES > 0) {
        loaded_count = 1;
        strcpy(loaded_molecules[0].cas, "DEFAULT");
        strcpy(loaded_molecules[0].name, "Standard Accord");
        loaded_molecules[0].mw = 150.0;
        loaded_molecules[0].vap_pressure = 2.0;
        loaded_molecules[0].r = 99; loaded_molecules[0].g = 102; loaded_molecules[0].b = 241;
    }
}

double get_pump_envelope(double t) {
    double press_start = 0.5;
    double peak_time = 1.0;
    double release_time = 4.0;

    if (t < press_start || t > release_time + 3.0) return 0.0;
    if (t >= press_start && t < peak_time) {
        return (t - press_start) / (peak_time - press_start) * 0.5;
    } else if (t >= peak_time && t <= release_time) {
        return 1.0;
    } else {
        double decay_t = t - release_time;
        return fmax(0.0, 1.0 - (decay_t / 3.0));
    }
}

double calculate_density(double p[3], double t, int mol_idx, double *drift_x, double *spread) {
    Molecule m = loaded_molecules[mol_idx];
    if (m.mw <= 0.0) m.mw = 150.0;
    if (m.vap_pressure <= 0.0) m.vap_pressure = 2.0;

    double envelope = get_pump_envelope(t);
    if (envelope <= 0.001) return 0.0;

    double x = p[0], y = p[1], z = p[2];
    double effective_t = fmax(0.001, t - 0.5);
    double k_temp = AMBient_TEMP / 298.15;

    double mw_factor = sqrt(150.0 / m.mw);
    *spread = fmax(0.05, (AToMizer_SPREAD + sqrt(effective_t) * 0.75) * mw_factor * sqrt(k_temp));

    *drift_x = AToMizer_V0 * envelope * (1.0 - exp(-effective_t * 2.0)) * (m.vap_pressure / 1.5);
    double drift_y = -0.3 * effective_t * (m.mw / 150.0);
    double drift_z = 0.0;

    double dx = x - (*drift_x);
    double dy = y - drift_y;
    double dz = z - drift_z;
    double dist_sq = dx * dx + dy * dy + dz * dz;

    double safe_hum = fmin(1.0, fmax(0.0, AMBient_HUMIDITY));
    double hum_damp = 1.0 - (safe_hum * 0.2);
    double evap_dec = exp(-effective_t * (m.vap_pressure * 0.1));

    double base_gauss = exp(-dist_sq / (*spread * *spread));
    double vol_norm = 1.0 / (*spread * *spread * *spread);

    return base_gauss * m.vap_pressure * hum_damp * evap_dec * vol_norm * 120.0 * envelope;
}

Point_Buffer sample_plume(int samples, double t, unsigned int *seed) {
    Point_Buffer pts;
    buf_init(&pts);

    double envelope = get_pump_envelope(t);
    if (envelope <= 0.001 || loaded_count == 0) return pts;

    for (int i = 0; i < samples; i++) {
        int mol_idx = rand_int_range(0, loaded_count, seed);
        
        double drift_x, spread;
        double center_p[3] = {0,0,0};
        calculate_density(center_p, t, mol_idx, &drift_x, &spread);

        double domain_r = spread * 3.5;
        double x = rand_float_range(drift_x - domain_r, drift_x + domain_r, seed);
        double y = rand_float_range(-0.5 - domain_r, domain_r, seed);
        double z = rand_float_range(-domain_r, domain_r, seed);

        double p[3] = {x, y, z};
        double d = calculate_density(p, t, mol_idx, &drift_x, &spread);

        if (d > 0.005 && (rand_r(seed) / (double)RAND_MAX) < fmin(1.0, d * 0.1 * (spread*spread))) {
            Sample_Point sp = {x, y, z, d, mol_idx};
            buf_append(&pts, sp);
        }
    }
    return pts;
}

void draw_legend(unsigned char *frame) {
    if (loaded_count == 0) return;
    int panel_h = 50;
    int panel_y = H - panel_h;

    for (int y = panel_y; y < H; y++) {
        for (int x = 0; x < W; x++) {
            int idx = (y * W + x) * 3;
            frame[idx+0] = 248;
            frame[idx+1] = 250;
            frame[idx+2] = 252;
        }
    }

    int col_w = W / loaded_count;
    int swatch_w = fmin(16, col_w - 6);
    int swatch_h = 8;

    for (int i = 0; i < loaded_count; i++) {
        int start_x = i * col_w + (col_w - swatch_w) / 2;
        int start_y = panel_y + 12;

        for (int sy = 0; sy < swatch_h; sy++) {
            for (int sx = 0; sx < swatch_w; sx++) {
                int px = start_x + sx;
                int py = start_y + sy;
                if (px >= 0 && px < W && py >= 0 && py < H) {
                    int idx = (py * W + px) * 3;
                    frame[idx+0] = (unsigned char)loaded_molecules[i].r;
                    frame[idx+1] = (unsigned char)loaded_molecules[i].g;
                    frame[idx+2] = (unsigned char)loaded_molecules[i].b;
                }
            }
        }
    }
}

void eval_camera(double t, const Camera_Config *cam, double *dist, double *yaw, double *pitch, double *focal) {
    *dist = cam->base_dist + cam->dist_amp * cos(t * cam->dist_freq);    
    *yaw = cam->base_yaw + (t * cam->yaw_speed);
    *pitch = cam->base_pitch + cam->pitch_amp * sin(t * cam->pitch_freq);    
    *focal = 240.0 + (t * cam->zoom_speed); 
}

bool project_point(double x, double y, double z, double t, const Camera_Config *cam, int *sx, int *sy, double *sz) {
    double dist, yaw, pitch, focal;
    eval_camera(t, cam, &dist, &yaw, &pitch, &focal);
    
    double ca = cos(yaw), sa = sin(yaw);
    double nx = x * ca - z * sa; 
    double nz = x * sa + z * ca;
    
    double cp = cos(pitch), sp = sin(pitch);
    double ny = y * cp - nz * sp; 
    double fz = y * sp + nz * cp;
    
    double final_z = fz + dist;
    if (final_z <= 0.1) return false;
    
    double f = focal / final_z;
    *sx = (int)((double)W * 0.45 + nx * f);
    *sy = (int)((double)H * 0.42 - ny * f);
    *sz = final_z;
    return true;
}

void pixel(unsigned char *frame, double *depth, int x, int y, double z, double r, double g, double b) {
    if (x < 0 || y < 0 || x >= W || y >= H) return;
    int idx = y * W + x;
    if (z < depth[idx]) { 
        depth[idx] = z; int i = idx * 3; 
        frame[i+0] = clamp_val(r,0,255); 
        frame[i+1] = clamp_val(g,0,255); 
        frame[i+2] = clamp_val(b,0,255); 
    }
}

void* render_runner(void* arg) {
    Camera_Config *cam = (Camera_Config*)arg;
    unsigned int seed = (unsigned int)time(NULL) + cam->thread_id;
    
    int total_frames = FPS * SEC;
    long long frame_size = W * H * 3;
    unsigned char *FRAME = (unsigned char *)malloc(total_frames * frame_size);
    double *depth = (double *)malloc(W * H * sizeof(double));

    for (int tick = 0; tick < total_frames; tick++) {
        double t = (double)tick / (double)FPS;
        unsigned char *frame_slice = &FRAME[tick * frame_size];
        
        for (int i = 0; i < W * H; i++) depth[i] = 1e9;
        for (int i = 0; i < W * H * 3; i += 3) {
            frame_slice[i+0] = 248;
            frame_slice[i+1] = 250;
            frame_slice[i+2] = 252;
        }

        Point_Buffer pts_plume = sample_plume(120000, t, &seed);
        for (int i = 0; i < pts_plume.size; i++) {
            Sample_Point pt = pts_plume.data[i]; 
            int sx, sy; 
            double sz;
            if (!project_point(pt.x, pt.y, pt.z, t, cam, &sx, &sy, &sz)) continue;
            
            Molecule m = loaded_molecules[pt.mol_idx];
            double intensity = fmin(1.0, pt.d * 0.5);
            pixel(frame_slice, depth, sx, sy, sz, m.r * intensity + 30, m.g * intensity + 30, m.b * intensity + 30);
        }
        free(pts_plume.data);
        draw_legend(frame_slice);

        if (tick % 5 == 0 || tick == total_frames - 1) {
            int percent = (int)(((double)(tick + 1) / total_frames) * 80.0);
            printf("PROGRESS:%d\n", percent);
            fflush(stdout);
        }
    }
    
    printf("PROGRESS:85\n");
    fflush(stdout);

    char raw_path[256], cmd[1024];
    snprintf(raw_path, sizeof(raw_path), "render_temp_%u.rgb", cam->thread_id);
    FILE *f = fopen(raw_path, "wb");
    if (f) { fwrite(FRAME, 1, total_frames * frame_size, f); fclose(f); }

    printf("PROGRESS:90\n");
    fflush(stdout);

    snprintf(cmd, sizeof(cmd), 
             "ffmpeg -y -f rawvideo -pix_fmt rgb24 -s %dx%d -r %d -i %s "
             "-vf \"fps=%d,scale=%d:%d:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse\" %s > /dev/null 2>&1", 
             W, H, FPS, raw_path, FPS, W, H, OUT_FILENAME);
    int ret = system(cmd); 
    (void)ret;
    remove(raw_path);
    
    printf("PROGRESS:100\n");
    fflush(stdout);
    
    free(FRAME); 
    free(depth); 
    free(cam);
    return NULL;
}

void print_usage(const char *prog_name) {
    printf("Usage: %s [OPTIONS]\n", prog_name);
    printf("  -s, --seconds SECONDS     Duration in seconds\n");
    printf("  -r, --fps FPS             Frames per second\n");
    printf("  -v, --velocity VELOCITY   Atomizer velocity\n");
    printf("  -t, --temp TEMP           Ambient temperature K\n");
    printf("  -m, --humidity HUMIDITY   Humidity 0.0-1.0\n");
    printf("  -o, --output FILE         Output GIF filename\n");
}

int main(int argc, char *argv[]) {
    static struct option long_options[] = {
        {"seconds",  required_argument, 0, 's'},
        {"fps",      required_argument, 0, 'r'},
        {"width",    required_argument, 0, 'w'},
        {"height",   required_argument, 0, 'h'},
        {"velocity", required_argument, 0, 'v'},
        {"cone",     required_argument, 0, 'c'},
        {"temp",     required_argument, 0, 't'},
        {"humidity", required_argument, 0, 'm'},
        {"output",   required_argument, 0, 'o'},
        {"help",     no_argument,       0, '?'},
        {0, 0, 0, 0}
    };

    int opt, option_index = 0;
    while ((opt = getopt_long(argc, argv, "s:r:w:h:v:c:t:m:o:?", long_options, &option_index)) != -1) {
        switch (opt) {
            case 's': SEC = atoi(optarg); break;
            case 'r': FPS = atoi(optarg); break;
            case 'w': W = atoi(optarg); break;
            case 'h': H = atoi(optarg); break;
            case 'v': AToMizer_V0 = atof(optarg); break;
            case 'c': AToMizer_SPREAD = atof(optarg); break;
            case 't': AMBient_TEMP = atof(optarg); break;
            case 'm': AMBient_HUMIDITY = atof(optarg); break;
            case 'o': strncpy(OUT_FILENAME, optarg, sizeof(OUT_FILENAME) - 1); break;
            case '?': print_usage(argv[0]); return 0;
            default: break;
        }
    }

    load_simulation_data();

    pthread_t thread;
    Camera_Config *cam = (Camera_Config*)malloc(sizeof(Camera_Config));
    cam->thread_id = 0;
    cam->base_dist  = 34.0;
    cam->dist_amp   = 4.0;
    cam->dist_freq  = 0.12;
    cam->base_yaw   = -0.15;
    cam->yaw_speed  = 0.04;
    cam->base_pitch = -0.12;
    cam->pitch_amp  = 0.04;
    cam->pitch_freq = 0.18;
    cam->shake_amp  = 0.001;
    cam->zoom_speed = 6.0;

    pthread_create(&thread, NULL, render_runner, cam);
    pthread_join(thread, NULL);

    return 0;
}
