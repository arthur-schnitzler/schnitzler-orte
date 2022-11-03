import pandas as pd
import urllib.request as urllib2
from io import BytesIO
import lxml.etree as ET
from tqdm import tqdm

from zipfile import ZipFile
from acdh_tei_pyutils.tei import TeiReader
from config import MASTER_FILE, NAME_SPACES

print("loading akon data into dataframe")
POSTKARTEN_DUMP = "https://labs.onb.ac.at/gitlab/labs-team/raw-metadata/raw/master/akon_postcards_public_domain.zip?inline=false"

print(f'downloading AKON Data from {POSTKARTEN_DUMP}')
r = urllib2.urlopen(POSTKARTEN_DUMP).read()
file = ZipFile(BytesIO(r))
cards_csv = file.open("akon_postcards_public_domain.csv")
cards_df = pd.read_csv(cards_csv, low_memory=False)
cards_df = cards_df[['geoname_id','download_link']].dropna().astype('str')
cards_df['geonames'] = cards_df['geoname_id'].apply(lambda x: "https://sws.geonames.org/{}/".format(str(x).replace('.0', '')))
cards_df = cards_df.drop_duplicates(subset='geoname_id', keep="first")
# cards_df.to_csv('akon.csv', index=False)

doc = TeiReader(MASTER_FILE)
df = cards_df

print(f"remove any akon links from {MASTER_FILE}")
for bad in doc.any_xpath('.//tei:link[@target]'):
    bad.getparent().remove(bad)

places = doc.any_xpath('.//tei:place')

print(f"and now add akon links to {MASTER_FILE}")
for x in tqdm(places, total=len(places)):
    try:
        geonames = x.xpath('./tei:idno[@type="geonames"]/text()', namespaces=NAME_SPACES)[0]
    except IndexError:
        continue
    try:
        akon = df.loc[df['geonames'] == geonames]["download_link"].values[0]
    except IndexError:
        continue
    link_node = ET.Element("{http://www.tei-c.org/ns/1.0}link")
    link_node.attrib['target'] = akon
    x.append(link_node)
doc.tree_to_file(MASTER_FILE)
print("done")