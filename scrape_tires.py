import re
from bs4 import BeautifulSoup
import requests

INPUT_URLS = "tire_urls.txt"
OUTPUT_PL = "tire_database.pl"

HEADERS = {"User-Agent": "Mozilla/5.0 (Compatible; PrologTireBot/3.0)"}


def clean_text(text):
  return text.strip().replace('"', '\\"')


def parse_product_url(url):
  parts = url.split("/")
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
    print(f"Error: {INPUT_URLS} not found. Run the shell script first.")
    return

  with open(OUTPUT_PL, "w", encoding="utf-8") as out:
    out.write(":- multifile tire_product/15.\n")
    out.write("% tire_product(Brand, Model, Size, ServiceDesc, Diameter, Width, RimRange, MeasuredRim, TreadDepth, LoadRange, MaxLoad, MaxPSI, MaxSpeed, Weight, Sidewall, RevsPerMile).\n\n")

    for url in urls:
      print(f"==> Scraping: {url}")
      brand, model_slug = parse_product_url(url)

      try:
        resp = requests.get(url, headers=HEADERS, timeout=10)
        if resp.status_code != 200:
          continue

        soup = BeautifulSoup(resp.text, "html.parser")

        # Target the specifications table highlighted in the section view
        table = soup.find("table", class_="full-specs") or soup.find(
            "table", class_="specs-table"
        )
        if not table:
          # Fallback generic table search inside product containers
          table = soup.find("table")

        if not table:
          continue

        rows = table.find_all("tr")
        for row in rows:
          cols = row.find_all(["th", "td"])
          cols = [clean_text(ele.text) for ele in cols]
          if len(cols) >= 12:
            # Expected columns layout mapped from target view:
            # [Size, Diameter, Width, Rim Range, Measured Rim, Tread Depth, Load Range, Max Load, Max PSI, Max Speed, Weight, Sidewall, Revs/Mile]
            size = cols[0]
            diameter = cols[1]
            width = cols[2]
            rim_range = cols[3]
            measured_rim = cols[4]
            tread_depth = cols[5]
            load_range = cols[6]
            max_load = cols[7]
            max_psi = cols[8]
            max_speed = cols[9]
            weight = cols[10]
            sidewall = cols[11]
            revs_mile = cols[12] if len(cols) > 12 else "N/A"

            fact = f'tire_product("{brand}", "{model_slug}", "{size}", "{diameter}", "{width}", "{rim_range}", "{measured_rim}", "{tread_depth}", "{load_range}", "{max_load}", "{max_psi}", "{max_speed}", "{weight}", "{sidewall}", "{revs_mile}").\n'
            out.write(fact)

      except Exception as e:
        print(f"    -> Error processing {url}: {e}")

  print(f"==> KB generation complete: {OUTPUT_PL}")


if __name__ == "__main__":
  main()
