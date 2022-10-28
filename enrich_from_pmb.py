import pandas as pd
import lxml.etree as ET
from acdh_tei_pyutils.tei import TeiReader
from config import MASTER_FILE, NAME_SPACES, PMB_LISTPLACE_DUMP, MASTER_ENRICHED

print(f"fetching PMB Places from {PMB_LISTPLACE_DUMP}")
doc = TeiReader(PMB_LISTPLACE_DUMP)

data = {}
for x in doc.any_xpath('.//tei:place[@xml:id]'):
    for y in x.xpath('./tei:idno[@subtype="pmb"]/text()', namespaces=NAME_SPACES):
        if y.endswith('/'):
            data[y] = {}
        else:
            data[f"{y}/"] = {}
        for idno in x.xpath('./tei:idno', namespaces=NAME_SPACES):
            domain = idno.attrib['subtype']
            uri = idno.text
            if domain == "pmb":
                continue
            elif domain == "geonames":
                continue
            else:
                if y.endswith('/'):
                    data[y][domain] = uri
                else:
                    data[f"{y}/"][domain] = uri

doc = TeiReader(MASTER_FILE)

for bad in doc.any_xpath('.//tei:idno[@type="website"]'):
    bad.getparent().remove(bad)

print(f"adding IDNOS into {MASTER_FILE} and save it into {MASTER_ENRICHED}")
for x in doc.any_xpath(".//tei:place"):
    pmb = x.xpath('./tei:idno[@type="pmb"]/text()', namespaces=NAME_SPACES)[0]
    match = data[pmb]
    for key, value in match.items():
        idno = ET.Element('{http://www.tei-c.org/ns/1.0}idno')
        idno.attrib['type'] = "website"
        idno.attrib['subtype'] = key
        idno.text = value
        x.append(idno)
doc.tree_to_file(MASTER_ENRICHED)
print("done")