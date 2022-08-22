import json
from acdh_tei_pyutils.tei import TeiReader
from collections import Counter


main_file = "./finalized-files/transformed-xml/19-strukturiert-tagesgenau.xml"
ns = {
    "tei": "http://www.tei-c.org/ns/1.0"
}
doc = TeiReader(main_file)
places = doc.any_xpath('.//tei:place')
items = []
for x in places:
    name = x.xpath('.//tei:placeName', namespaces=ns)[0].text
    coords = x.xpath('.//tei:geo', namespaces=ns)[0].text
    try:
        img = x.xpath('.//tei:link', namespaces=ns)[0].attrib['target']
    except IndexError:
        img = ""
    items.append("__".join([name, coords, img]))
data_raw = dict(Counter(items))
data = []
for key, value in data_raw.items():
    if value > 1000 or value < 2:
        continue

    item = {}
    name, coords, img = key.split("__")
    lat, lng = coords.split()
    try:
        item = {
            "name": name,
            "lat": float(lat),
            "lng": float(lng),
            "count": int(value)
        }
    except ValueError:
        continue
    data.append(item)
newlist = sorted(data, key=lambda d: d['count'], reverse=True) 

with open('./html/data/heatmap.json', 'w') as f:
    json.dump(newlist, f, ensure_ascii=False)