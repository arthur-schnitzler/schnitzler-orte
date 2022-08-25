#!/bin/bash

echo "Prepare Storymap data"
python make_storymap_data.py

echo "Prepare Heatmap data"
python make_heatmap_data.py

echo "Prepare Travel data"

echo "Build the HTML pages"

python build_website.py


