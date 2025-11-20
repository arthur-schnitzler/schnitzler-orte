#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "===== Starting build process ====="

echo "Step 1/6: Enrich data from PMB"
python3 enrich_from_pmb.py

echo "Step 2/6: Prepare Storymap data"
python3 make_storymap_data.py

echo "Step 3/6: Prepare Heatmap data"
python3 make_heatmap_data.py

echo "Step 4/6: Prepare Travel/Network data"
python3 make_dist_and_network_data.py

echo "Step 5/6: Prepare Towers data"
python3 make_towers.py

echo "Step 6/6: Build HTML pages, sitemap, and robots.txt"
python3 build_website.py

echo "===== Build completed successfully ====="
echo "Generated files:"
ls -lh ./html/data/*.json 2>/dev/null | wc -l | xargs echo "  - JSON files:"
ls -lh ./html/data/*.csv 2>/dev/null | wc -l | xargs echo "  - CSV files:"
ls -lh ./html/*.html 2>/dev/null | wc -l | xargs echo "  - HTML pages:"


