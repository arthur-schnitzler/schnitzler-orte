import pandas as pd
from AcdhArcheAssets.uri_norm_rules import get_normalized_uri
from acdh_tei_pyutils.tei import TeiReader

SCHNITZLER_ORTE_CSV = "./finalized-files/places.csv"
PMB_LISTPLACE = "https://raw.githubusercontent.com/arthur-schnitzler/schnitzler-entities/main/indices/listplace.xml"

def fix_geonames(x):
    try:
        return get_normalized_uri(x)
    except TypeError:
        return x

doc = TeiReader(PMB_LISTPLACE)
d = dict()
for x in doc.any_xpath('.//tei:place'):
    xml_id = x.attrib['{http://www.w3.org/XML/1998/namespace}id']
    urls = [x.text for x in x.xpath('.//tei:idno[@type="URL"]', namespaces={'tei': 'http://www.tei-c.org/ns/1.0'}) if 'geonames' in x.text]
    if urls:
        for u in urls:
            d[get_normalized_uri(u)] = xml_id

pmb_list = []
for key, value in d.items():
    item = {}
    item['geonames'] = key
    url_pattern = "https://pmb.acdh.oeaw.ac.at/apis/entities/entity/place/{}/detail"
    item['pmb_id'] = url_pattern.format(value.replace('place__', ''))
    pmb_list.append(item)
pmb_df = pd.DataFrame(pmb_list)

df = pd.read_csv(SCHNITZLER_ORTE_CSV)
df['geonames'] = df['desc/placeName/_ref'].apply(lambda x: fix_geonames(x))
pd.merge(df, pmb_df, on=['geonames'], how='left').to_csv("./finalized-files/places_with_pmb.csv", index=False)