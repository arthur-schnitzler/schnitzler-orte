import pandas as pd

from tqdm import tqdm
from acdh_tei_pyutils.tei import TeiReader
from config import MASTER_FILE, NAME_SPACES


main_file = MASTER_FILE
ns = NAME_SPACES

doc = TeiReader(main_file)
places = doc.any_xpath('.//tei:place')
data = {}
for x in tqdm(places, total=len(places)):
    xml_id = x.xpath('./tei:idno[@type="pmb"]/text()', namespaces=ns)[0]
    try:
        item = data[xml_id]
        item["amount"] = item['amount'] + 1
        continue
    except KeyError:
        item = {}
    item["amount"] = 1
    item["pmb"] = xml_id
    try:
        image = x.xpath('./tei:link/@target', namespaces=ns)[0]
        item["image"] = image.replace("full/full/0/native.jpg", "full/800,/0/default.jpg")
    except IndexError:
        item["image"] = False
    try:
        coords = x.xpath('.//tei:geo', namespaces=ns)[0].text
    except IndexError:
        continue
    try:
        lat, lng = coords.split()[0:2]
    except AttributeError:
        continue
    try:
        item['lat'] = float(lat)
        item['lng'] = float(lng)
    except ValueError:
        continue
    item["name"] = " ".join(x.xpath('.//tei:placeName', namespaces=ns)[0].text.split())
    data[xml_id] = item

df = pd.DataFrame([value for _, value in data.items()])
df = df.sort_values(by=['amount'], ascending=False)
df.to_csv('./html/data/places.csv', index=False)
