import pandas as pd
import lxml.etree as ET
from acdh_tei_pyutils.tei import TeiReader
from config import MASTER_FILE, NAME_SPACES, PMB_LISTPLACE_DUMP, MASTER_ENRICHED

print(f"fetching PMB Places from {PMB_LISTPLACE_DUMP}")
doc = TeiReader(PMB_LISTPLACE_DUMP)
doc.tree_to_file("hansi.xml")

data = {}
for x in doc.any_xpath(".//tei:place[@xml:id]"):
    for y in x.xpath('./tei:idno[@subtype="pmb"]/text()', namespaces=NAME_SPACES):
        if y.endswith("/"):
            data[y] = {}
        else:
            data[f"{y}/"] = {}
        for idno in x.xpath("./tei:idno", namespaces=NAME_SPACES):
            try:
                domain = idno.attrib["subtype"]
            except KeyError:
                print(f"no idno type subtype for {y}")
                continue
            uri = idno.text
            if domain == "pmb":
                continue
            elif domain == "geonames":
                continue
            else:
                if y.endswith("/"):
                    data[y][domain] = uri
                else:
                    data[f"{y}/"][domain] = uri

doc = TeiReader(MASTER_FILE)

for bad in doc.any_xpath('.//tei:idno[@type="website"]'):
    bad.getparent().remove(bad)

print(f"adding IDNOS into {MASTER_FILE} and save it into {MASTER_ENRICHED}")
missing_entries = []
enriched_count = 0
skipped_count = 0

for x in doc.any_xpath(".//tei:place"):
    pmb = x.xpath('./tei:idno[@subtype="pmb"]/text()', namespaces=NAME_SPACES)[0]

    # Check if PMB entry exists in data
    if pmb not in data:
        # Try with trailing slash if not present
        pmb_with_slash = pmb if pmb.endswith("/") else f"{pmb}/"
        if pmb_with_slash in data:
            match = data[pmb_with_slash]
        else:
            missing_entries.append(pmb)
            skipped_count += 1
            continue
    else:
        match = data[pmb]

    # Add IDNOs to place
    for key, value in match.items():
        idno = ET.Element("{http://www.tei-c.org/ns/1.0}idno")
        idno.attrib["type"] = "website"
        idno.attrib["subtype"] = key.replace("-", "_")
        idno.text = value
        x.append(idno)
    enriched_count += 1

doc.tree_to_file(MASTER_ENRICHED)

# Print summary
print(f"✓ Enrichment complete:")
print(f"  - Enriched: {enriched_count} places")
print(f"  - Skipped: {skipped_count} places (PMB entry not found)")
if missing_entries and len(missing_entries) <= 10:
    print(f"  - Missing PMB entries: {', '.join(missing_entries)}")
elif missing_entries:
    print(f"  - First 10 missing PMB entries: {', '.join(missing_entries[:10])}")
print("done")
