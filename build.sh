#!/bin/bash

echo "Enrich"
python3 enrich_from_pmb.py

echo "Prepare Storymap data"
python3 make_storymap_data.py

echo "Prepare Heatmap data"
python3 make_heatmap_data.py

echo "Prepare Travel data"
python3 make_dist_and_network_data.py

echo "Prepare Towers data"
python3 make_towers.py

echo "Build the HTML pages"

python3 build_website.py


