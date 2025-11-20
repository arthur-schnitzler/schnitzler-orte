"""
Build script for schnitzler-orte website

This script:
1. Fetches the imprint from ACDH-CH
2. Renders all Jinja2 templates to HTML
3. Generates sitemap.xml with all pages
4. Generates robots.txt

Usage:
    python build_website.py

Generated files in ./html/:
    - *.html (from templates/static/*.j2)
    - sitemap.xml (SEO sitemap for all pages)
    - robots.txt (crawler instructions)
"""

import glob
import jinja2
import os
import shutil
import requests
from datetime import datetime
from xml.etree.ElementTree import Element, SubElement, tostring
from xml.dom import minidom

print("fetch imprint")
r = requests.get("https://imprint.acdh.oeaw.ac.at/20818?locale=de")
imprint_text = r.text
imprint = """{% extends "templates/partials/base.j2" %}
{% block content %}
<div class="container">
"""
imprint += imprint_text
imprint += "\n</div>\n{% endblock %}"
with open("./templates/static/imprint.j2", "w", encoding="utf-8") as f:
    f.write(imprint)

templateLoader = jinja2.FileSystemLoader(searchpath=".")
templateEnv = jinja2.Environment(loader=templateLoader)

print("Hello, let's start building")

# Clear the existing HTML files in the "./html" folder
for x in glob.glob("./html/*.html"):
    os.unlink(x)

# Check if there is an HTML file in ./templates/static
static_html_files = glob.glob("./templates/static/*.html")
if static_html_files:
    for html_file in static_html_files:
        shutil.copy(html_file, f"./{os.path.basename(html_file)}")
        print(f"Copied {html_file} to {os.path.basename(html_file)}")


files = glob.glob("./templates/static/*.j2")
print("Building static content")
html_files = []
for x in files:
    template = templateEnv.get_template(x)
    _, tail = os.path.split(x)
    filename = tail.replace(".j2", ".html")
    with open(f'./html/{filename}', "w") as f:
        f.write(template.render({"objects": {}}))
    html_files.append(filename)

# Generate sitemap.xml
print("Generating sitemap.xml")

def generate_sitemap(base_url, html_files):
    """Generate sitemap.xml for all HTML pages"""
    urlset = Element('urlset')
    urlset.set('xmlns', 'http://www.sitemaps.org/schemas/sitemap/0.9')

    # Define priorities and change frequencies for different page types
    page_config = {
        'index.html': {'priority': '1.0', 'changefreq': 'weekly'},
        'arcs.html': {'priority': '0.8', 'changefreq': 'monthly'},
        'towers.html': {'priority': '0.8', 'changefreq': 'monthly'},
        'network.html': {'priority': '0.8', 'changefreq': 'monthly'},
        'travel-net-map.html': {'priority': '0.8', 'changefreq': 'monthly'},
        'flourish.html': {'priority': '0.8', 'changefreq': 'monthly'},
        'itineraries.html': {'priority': '0.8', 'changefreq': 'monthly'},
        'imprint.html': {'priority': '0.3', 'changefreq': 'yearly'},
    }

    lastmod = datetime.now().strftime('%Y-%m-%d')

    for html_file in sorted(html_files):
        url = SubElement(urlset, 'url')

        # Create full URL
        if html_file == 'index.html':
            loc_text = base_url
        else:
            loc_text = f"{base_url}{html_file}"

        loc = SubElement(url, 'loc')
        loc.text = loc_text

        lastmod_elem = SubElement(url, 'lastmod')
        lastmod_elem.text = lastmod

        # Set priority and changefreq based on page type
        config = page_config.get(html_file, {'priority': '0.5', 'changefreq': 'monthly'})

        changefreq = SubElement(url, 'changefreq')
        changefreq.text = config['changefreq']

        priority = SubElement(url, 'priority')
        priority.text = config['priority']

    # Pretty print XML
    rough_string = tostring(urlset, 'utf-8')
    reparsed = minidom.parseString(rough_string)
    return reparsed.toprettyxml(indent="  ", encoding='utf-8').decode('utf-8')

base_url = "https://schnitzler-orte.acdh.oeaw.ac.at/"
sitemap_content = generate_sitemap(base_url, html_files)

with open('./html/sitemap.xml', 'w', encoding='utf-8') as f:
    f.write(sitemap_content)
print("✓ sitemap.xml created")

# Generate robots.txt
print("Generating robots.txt")
robots_content = f"""# robots.txt for {base_url}
User-agent: *
Allow: /

# Sitemaps
Sitemap: {base_url}sitemap.xml

# Crawl-delay for polite crawling
Crawl-delay: 1
"""

with open('./html/robots.txt', 'w', encoding='utf-8') as f:
    f.write(robots_content)
print("✓ robots.txt created")

print("\nBuild complete! Generated files:")
print(f"  - {len(html_files)} HTML pages")
print(f"  - sitemap.xml with {len(html_files)} URLs")
print(f"  - robots.txt")
