#!/bin/bash

echo "Prepare Storymap the data"
python make_storymap_data.py

echo "Prepare Heatmap the data"
python make_heatmap_data.py

echo "Build the HTML pages"

python build_website.py


