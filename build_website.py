import glob
import jinja2
import os
import shutil
import requests

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
for x in files:
    template = templateEnv.get_template(x)
    _, tail = os.path.split(x)
    with open(f'./html/{tail.replace(".j2", ".html")}', "w") as f:
        f.write(template.render({"objects": {}}))
