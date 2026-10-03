#version 330 core
in vec2 uv;
out vec4 fragColor;
uniform vec2 u_resolution;
uniform float u_time;
uniform float u_velocity;
uniform float u_temp;
uniform float u_humidity;

// Robust Signed Distance Function for Glass Bottle Flacon
float sdBottle(vec3 p, float pushdown) {
    vec3 q = p;
    q.y -= 0.1; // Center bottle in viewport
    
    // Outer body
    float body_outer = length(max(abs(q) - vec3(0.5, 0.7, 0.3), 0.0)) - 0.1;
    // Inner hollow cavity
    float body_inner = length(max(abs(q) - vec3(0.42, 0.62, 0.24), 0.0)) - 0.08;
    float body = max(body_outer, -body_inner);
    
    // Bottle neck
    vec3 n = q;
    n.y -= 0.75;
    float neck = length(max(abs(n) - vec3(0.18, 0.25, 0.18), 0.0)) - 0.04;
    
    // Actuator pump head with pushdown physics
    vec3 act = q;
    act.y -= (1.05 - pushdown);
    float actuator = length(max(abs(act) - vec3(0.24, 0.08, 0.24), 0.0)) - 0.03;
    
    return min(min(body, neck), actuator);
}

// Liquid substance confined strictly inside the lower interior of the bottle
float sdLiquid(vec3 p) {
    vec3 q = p;
    q.y -= -0.15; // Positioned at the bottom interior
    return length(max(abs(q) - vec3(0.38, 0.35, 0.22), 0.0)) - 0.04;
}

// Multi-pump atomized plume dispersion
float getPlume(vec3 p, float t) {
    float total_density = 0.0;
    float pump_times[3] = float[3](1.0, 2.5, 4.0);
    
    for(int i = 0; i < 3; i++) {
        float pt = pump_times[i];
        float active = smoothstep(pt, pt + 0.1, t) * (1.0 - smoothstep(pt + 1.2, pt + 2.0, t));
        if (active > 0.0) {
            float eff_t = max(0.001, t - pt);
            float drift = u_velocity * 0.09 * eff_t;
            vec3 spray_origin = vec3(0.0, 0.85, drift);
            float dist = length(p - spray_origin);
            float spread = 0.15 + eff_t * (u_temp / 300.0) * 0.55;
            float humidity_damp = 1.0 - (u_humidity * 0.25);
            total_density += exp(-dist * dist / (spread * spread)) * active * 2.5 * humidity_damp;
        }
    }
    return clamp(total_density, 0.0, 1.0);
}

void main() {
    vec2 coord = (gl_FragCoord.xy * 2.0 - u_resolution.xy) / u_resolution.y;
    vec3 ro = vec3(0.0, 0.2, 3.2);
    vec3 rd = normalize(vec3(coord, -1.8));
    
    // Pushdown sync cycle
    float cycle_t = mod(u_time, 5.5);
    float pushdown = 0.0;
    if ((cycle_t > 1.0 && cycle_t < 1.4) || (cycle_t > 2.5 && cycle_t < 2.9) || (cycle_t > 4.0 && cycle_t < 4.4)) {
        pushdown = 0.07 * abs(sin((cycle_t) * 10.0));
    }
    
    float t = 0.0;
    vec3 p;
    float hitBottle = 0.0;
    float hitLiquid = 0.0;
    
    for(int i=0; i<120; i++) {
        p = ro + rd * t;
        float d_bottle = sdBottle(p, pushdown);
        float d_liq = sdLiquid(p);
        
        if (d_bottle < 0.0005) { hitBottle = 1.0; break; }
        if (d_liq < 0.0005) { hitLiquid = 1.0; break; }
        
        t += min(d_bottle, d_liq);
        if (t > 12.0) break;
    }
    
    vec3 col = vec3(0.96, 0.97, 0.99); // Lab background
    
    if (hitBottle > 0.5) {
        vec2 e = vec2(0.001, 0.0);
        vec3 n = normalize(vec3(sdBottle(p+e.xyy, pushdown) - sdBottle(p-e.xyy, pushdown),
                                sdBottle(p+e.yxy, pushdown) - sdBottle(p-e.yxy, pushdown),
                                sdBottle(p+e.yyx, pushdown) - sdBottle(p-e.yyx, pushdown)));
        float diff = max(dot(n, normalize(vec3(1.0, 2.0, 1.0))), 0.25);
        vec3 glass_tint = vec3(0.78, 0.85, 0.94);
        col = mix(glass_tint, vec3(0.98, 0.99, 1.0), diff);
    } else if (hitLiquid > 0.5) {
        // Vibrant liquid pool inside the bottle
        col = vec3(0.35, 0.38, 0.92);
    }
    
    // Plume atomization spray
    float plumeDensity = getPlume(ro + rd * 1.5, u_time);
    if (plumeDensity > 0.01) {
        col = mix(col, vec3(0.45, 0.48, 0.95), plumeDensity * 0.8);
    }
    
    fragColor = vec4(col, 1.0);
}
