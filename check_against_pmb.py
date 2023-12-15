import pandas as pd
from AcdhArcheAssets.uri_norm_rules import get_normalized_uri
from acdh_tei_pyutils.tei import TeiReader
from zipfile import ZipFile
from io import BytesIO
import urllib.request as urllib2
from tqdm import tqdm


SCHNITZLER_ORTE_CSV = "./finalized-files/places.csv"
PMB_LISTPLACE = "https://raw.githubusercontent.com/arthur-schnitzler/schnitzler-entities/main/indices/listplace.xml"
POSTKARTEN_DUMP = "https://labs.onb.ac.at/gitlab/labs-team/raw-metadata/raw/master/akon_postcards_public_domain.zip?inline=false"

print(f"downloading AKON Data from {POSTKARTEN_DUMP}")
r = urllib2.urlopen(POSTKARTEN_DUMP).read()
file = ZipFile(BytesIO(r))
cards_csv = file.open("akon_postcards_public_domain.csv")
cards_df = pd.read_csv(cards_csv, low_memory=False)
cards_df = cards_df[["geoname_id", "download_link"]].dropna().astype("str")
cards_df["geonames"] = cards_df["geoname_id"].apply(
    lambda x: "https://sws.geonames.org/{}/".format(str(x).replace(".0", ""))
)
cards_df = cards_df.drop_duplicates(subset="geoname_id", keep="first")


def fix_geonames(x):
    try:
        return get_normalized_uri(x)
    except TypeError:
        return x


print(f"loading PMB Places from {PMB_LISTPLACE}")
doc = TeiReader(PMB_LISTPLACE)
d = dict()
places = doc.any_xpath(".//tei:place")
for x in tqdm(places, total=len(places)):
    xml_id = x.attrib["{http://www.w3.org/XML/1998/namespace}id"]
    urls = [
        x.text
        for x in x.xpath(
            './/tei:idno[@type="URL"]',
            namespaces={"tei": "http://www.tei-c.org/ns/1.0"},
        )
        if "geonames" in x.text
    ]
    if urls:
        for u in urls:
            d[get_normalized_uri(u)] = xml_id

pmb_list = []
for key, value in d.items():
    item = {}
    item["geonames"] = key
    url_pattern = "https://pmb.acdh.oeaw.ac.at/apis/entities/entity/place/{}/detail"
    item["pmb_id"] = url_pattern.format(value.replace("place__", ""))
    pmb_list.append(item)
pmb_df = pd.DataFrame(pmb_list)

df = pd.read_csv(SCHNITZLER_ORTE_CSV)
df["geonames"] = df["desc/placeName/_ref"].apply(lambda x: fix_geonames(x))
with_pmb = pd.merge(df, pmb_df, on=["geonames"], how="left")
with_pmb.to_csv("finalized-files/places_with_pmb.csv")

with_akon = pd.merge(with_pmb, cards_df, on=["geonames"], how="left")
with_akon.to_csv("finalized-files/places_with_pmb_and_akon.csv")


all_uris = "./finalized-files/places_with_pmb_and_akon.csv"
main_file = "./finalized-files/transformed-xml/19-strukturiert-tagesgenau.xml"

print(f"write pmb/akon ids into {main_file} using {all_uris} as input")

df_dict = (
    pd.read_csv(all_uris)
    .drop_duplicates(subset="geonames", keep="first")
    .set_index("geonames")
    .to_dict("index")
)
doc = TeiReader(main_file)
places = doc.any_xpath(".//tei:place")
no_match = set()
for x in tqdm(places, total=len(places)):
    geonames = x.xpath('.//*[@type="geonames"]')[0].text
    fixed_geonames = get_normalized_uri(geonames)
    x.xpath('.//*[@type="geonames"]')[0].text = fixed_geonames
    try:
        pmb = df_dict[fixed_geonames]["pmb_id"]
        akon = df_dict[fixed_geonames]["download_link"]
    except KeyError:
        no_match.add(
            f"{geonames}__{x.xpath('.//tei:placeName/text()', namespaces={'tei': 'http://www.tei-c.org/ns/1.0'})[0]}"
        )
        continue
    if isinstance(pmb, str):
        x.xpath('.//*[@type="pmb"]')[0].text = pmb
    if isinstance(akon, str):
        x.xpath(
            ".//tei:link[@target]", namespaces={"tei": "http://www.tei-c.org/ns/1.0"}
        )[0].attrib["target"] = akon
doc.tree_to_file(main_file)
print("no geonames-matches found for:")
for x in no_match:
    print(x)
