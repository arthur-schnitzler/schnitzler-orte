import pandas as pd
from AcdhArcheAssets.uri_norm_rules import get_normalized_uri
from acdh_tei_pyutils.tei import TeiReader
from zipfile import ZipFile
from io import BytesIO
import urllib.request as urllib2

SCHNITZLER_ORTE_CSV = "./finalized-files/places_per_day.csv"
PMB_LISTPLACE = "https://raw.githubusercontent.com/arthur-schnitzler/schnitzler-entities/main/indices/listplace.xml"
POSTKARTEN_DUMP = "https://labs.onb.ac.at/gitlab/labs-team/raw-metadata/raw/master/akon_postcards_public_domain.zip?inline=false"

r = urllib2.urlopen(POSTKARTEN_DUMP).read()
file = ZipFile(BytesIO(r))
cards_csv = file.open("akon_postcards_public_domain.csv")
cards_df = pd.read_csv(cards_csv, low_memory=False)
cards_df = cards_df[['geoname_id','download_link']].dropna().astype('str')
cards_df['geonames'] = cards_df['geoname_id'].apply(lambda x: "https://sws.geonames.org/{}/".format(str(x).replace('.0', '')))
cards_df = cards_df.drop_duplicates(subset='geoname_id', keep="first")

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
with_pmb = pd.merge(df, pmb_df, on=['geonames'], how='left')
with_pmb.to_csv('finalized-files/places_with_pmb_all-days.csv')

with_akon = pd.merge(with_pmb, cards_df, on=['geonames'], how='left')
with_akon.to_csv('finalized-files/places_with_pmb_and_akon_all-days.csv')
