import json
from acdh_tei_pyutils.tei import TeiReader
from tqdm import tqdm
from config import MASTER_ENRICHED, FILTER_WORDS


main_file = MASTER_ENRICHED

START_YEAR, END_YEAR = 1879, 1932

ns = {"tei": "http://www.tei-c.org/ns/1.0"}


def get_name(node):
    return " ".join(node.xpath("./tei:placeName/text()", namespaces=ns)[0].split())


doc = TeiReader(main_file)
all_places = doc.any_xpath(".//tei:place")
places = []
for x in all_places:
    add_name = True
    name = get_name(x)
    for s in FILTER_WORDS:
        if s in name.lower():
            add_name = False
    if add_name:
        places.append(x)

no_match = set()
for year in tqdm(range(START_YEAR, END_YEAR), total=len(range(START_YEAR, END_YEAR))):
    story_map_data = {
        "storymap": {
            "call_to_action": True,
            "call_to_action_text": "",
            "map_as_image": False,
            "zoomify": True,
            "map_type": "",
            "map_subdomains": "",
            "attribution": "",
            "slides": [],
        }
    }
    for i, x in enumerate(places):
        cur_date = x.xpath(".//ancestor::tei:event[1]", namespaces=ns)[0].attrib["when"]
        if f"{year}" in cur_date:
            parent = x.getparent()
            name = get_name(x)
            slide = {}
            try:
                next_place = places[i + 1]
            except IndexError:
                next_place = None
            if next_place is not None:
                next_name = get_name(next_place)
            if name == next_name:
                continue
            else:
                date = x.xpath(".//ancestor::tei:event[1]", namespaces=ns)[0].attrib[
                    "when"
                ]
                slide["text"] = {
                    "headline": name,
                    "text": f"Schnitzler war am {date} in {name}",
                }
                try:
                    akon = x.xpath(".//tei:link", namespaces=ns)[0].attrib["target"]
                except IndexError:
                    akon = None
                if akon is not None:
                    slide["media"] = {
                        "caption": f"Postkarte von {name}",
                        "credit": "ÖNB",
                        "url": f"{akon}",
                    }
                # try:
                try:
                    coords = x.xpath(".//tei:geo/text()", namespaces=ns)[0]
                except IndexError:
                    print(name, x.xpath(".//tei:geo[0]/text()", namespaces=ns))
                    continue
                lat, lon = coords.split()[0:2]
                # except (ValueError, IndexError):
                #     print(date, name, x.xpath('.//tei:geo/text()', namespaces=ns))
                #     continue
                try:
                    slide["location"] = {
                        "lat": float(lat),
                        "line": True,
                        "lon": float(lon),
                        "zoom": 12,
                    }
                except ValueError:
                    continue
                slide["date"] = date
                story_map_data["storymap"]["slides"].append(slide)
    with open(f"./html/data/{year}.json", "w") as f:
        json.dump(story_map_data, f)
