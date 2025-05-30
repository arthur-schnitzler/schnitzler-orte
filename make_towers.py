import pandas as pd
from tqdm import tqdm
from acdh_tei_pyutils.tei import TeiReader
from config import MASTER_ENRICHED, NAME_SPACES

main_file = MASTER_ENRICHED
ns = NAME_SPACES

doc = TeiReader(main_file)
places = doc.any_xpath(".//tei:place")
print(f"{len(places)} place-Elemente gefunden")
data = {}
for i, x in enumerate(tqdm(places, total=len(places))):
    print(f"\nVerarbeite place {i+1}")
    try:
        xml_id_nodes = x.xpath('./tei:idno[@subtype="pmb"][1]/text()', namespaces=ns)
        if not xml_id_nodes:
            continue
        xml_id = xml_id_nodes[0]
    except IndexError:
        continue  # Wenn kein xml_id vorhanden ist, überspringe diesen Eintrag

    try:
        item = data[xml_id]
        item["amount"] = item.get("amount", 0) + 1
        print(f"  → xml_id gefunden: {xml_id}")
    except KeyError:
        item = {"amount": 1}

    item["pmb"] = xml_id
    try:
        image = x.xpath("./tei:link/@target", namespaces=ns)[0]
        item["image"] = image.replace("full/full/0/native.jpg", "full/800,/0/default.jpg")
        print(f"  → xml_id gefunden: {xml_id}")
    except IndexError:
        item["image"] = False
    
    for idno in x.xpath('.//tei:idno[@type="website"]', namespaces=ns):
        item[idno.attrib["subtype"]] = idno.text

    try:
        coords = x.xpath(".//tei:geo", namespaces=ns)[0].text
        if coords:
            lat, lng = coords.split()[0:2]
            item["lat"] = float(lat.replace(",", "."))
            item["lng"] = float(lng.replace(",", "."))
        print(f"  → xml_id gefunden: {xml_id}")
    except (IndexError, AttributeError, ValueError):
        continue  # Wenn Koordinaten fehlen oder fehlerhaft sind, überspringe diesen Eintrag

    item["name"] = " ".join(x.xpath(".//tei:placeName", namespaces=ns)[0].text.split())
    data[xml_id] = item

# Überprüfe den Inhalt von data
if data:
    df = pd.DataFrame([value for _, value in data.items()])
    print(df.columns)  # Überprüfe die Spalten des DataFrames
    df = df.sort_values(by=["amount"], ascending=False)
    df.to_csv("./html/data/places.csv", index=False)
else:
    print("Keine Daten zum Erstellen des DataFrames vorhanden.")
