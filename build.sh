#!/bin/bash

echo "Enrich"
python enrich_from_pmb.py

echo "Prepare Storymap data"
python make_storymap_data.py

echo "Prepare Heatmap data"
python make_heatmap_data.py

echo "Prepare Travel data"
python make_dist_and_network_data.py

echo "Prepare Towers data"
python make_towers.py

echo "Build the HTML pages"

python build_website.py


