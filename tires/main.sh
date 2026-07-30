#!/usr/bin/env sh
set -eu

URLS_FILE="tire_urls.txt"
BASE_DOMAIN="https://tiresize.com"
INDEX_URL="$BASE_DOMAIN/tiresizes/"
PYTHON_SCRIPT="scrape_tires.py"

for cmd in curl python3 sed awk grep tr; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Error: Required utility '$cmd' is missing." >&2
        exit 1
    fi
done

> "$URLS_FILE"

echo "==> Fetching primary index: $INDEX_URL"
INDEX_HTML=$(curl -sL -A "Mozilla/5.0 (Compatible; PrologTireBot/3.0)" "$INDEX_URL" || true)

DIM_SLUGS=$(echo "$INDEX_HTML" \
    | grep -oE 'tiresizes/[0-9]+-[0-9]+R[0-9]+\.htm' \
    | sort -u || true)

if [ -z "$DIM_SLUGS" ]; then
    DIM_SLUGS="tiresizes/185-60R13.htm"
fi

for dim_slug in $DIM_SLUGS; do
    DIM_URL="$BASE_DOMAIN/$dim_slug"
    echo "==> Traversing dimension page: $DIM_URL"
    
    DIM_HTML=$(curl -sL -A "Mozilla/5.0 (Compatible; PrologTireBot/3.0)" "$DIM_URL" || true)
    
    PRODUCT_LINKS=$(echo "$DIM_HTML" \
        | grep -oE '/tires/[A-Za-z0-9_-]+/[A-Za-z0-9_.-]+\.htm' \
        | sort -u || true)
        
    if [ -z "$PRODUCT_LINKS" ]; then
        continue
    fi
    
    for prod_path in $PRODUCT_LINKS; do
        echo "$BASE_DOMAIN$prod_path" >> "$URLS_FILE"
    done
    
    sleep 0.1
done

echo "==> Complete. Product URLs written to $URLS_FILE"

echo "==> Creating Python scraper script: $PYTHON_SCRIPT"
cat << 'EOF' > "$PYTHON_SCRIPT"
import requests
from bs4 import BeautifulSoup

INPUT_URLS = "tire_urls.txt"
OUTPUT_PL = "tire_database.pl"
HEADERS = {"User-Agent": "Mozilla/5.0 (Compatible; PrologTireBot/3.0)"}

def clean_text(text):
    return text.strip().replace('"', '\\"')

def parse_product_url(url):
    parts = url.split('/')
    if len(parts) >= 6:
        brand = parts[4]
        model_slug = parts[5].replace(".htm", "")
        return brand, model_slug
    return "Unknown", "Unknown"

def main():
    try:
        with open(INPUT_URLS, "r") as f:
            urls = [line.strip() for line in f if line.strip()]
    except FileNotFoundError:
        print(f"Error: {INPUT_URLS} not found.")
        return

    with open(OUTPUT_PL, "w", encoding="utf-8") as out:
        out.write(":- multifile tire_product/15.\n")
        out.write("% tire_product(Brand, Model, Size, Diameter, Width, RimRange, MeasuredRim, TreadDepth, LoadRange, MaxLoad, MaxPSI, MaxSpeed, Weight, Sidewall, RevsPerMile).\n\n")

        for url in urls:
            print(f"==> Scraping: {url}")
            brand, model_slug = parse_product_url(url)
            try:
                resp = requests.get(url, headers=HEADERS, timeout=10)
                if resp.status_code != 200:
                    continue
                soup = BeautifulSoup(resp.text, "html.parser")
                table = soup.find("table", class_="full-specs") or soup.find("table", class_="specs-table") or soup.find("table")
                if not table:
                    continue
                for row in table.find_all("tr"):
                    cols = row.find_all(["th", "td"])
                    cols = [clean_text(ele.text) for ele in cols]
                    if len(cols) >= 12:
                        size, diameter, width, rim_range, measured_rim, tread_depth, load_range, max_load, max_psi, max_speed, weight, sidewall = cols[:12]
                        revs_mile = cols[12] if len(cols) > 12 else "N/A"
                        fact = f'tire_product("{brand}", "{model_slug}", "{size}", "{diameter}", "{width}", "{rim_range}", "{measured_rim}", "{tread_depth}", "{load_range}", "{max_load}", "{max_psi}", "{max_speed}", "{weight}", "{sidewall}", "{revs_mile}").\n'
                        out.write(fact)
            except Exception as e:
                print(f"    -> Error processing {url}: {e}")

    print(f"==> KB generation complete: {OUTPUT_PL}")

if __name__ == "__main__":
    main()
EOF

echo "==> Invoking Python scraper..."
python3 "$PYTHON_SCRIPT"
