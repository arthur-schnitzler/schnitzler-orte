from acdh_tei_pyutils.tei import TeiReader
import json


main_file = "./finalized-files/transformed-xml/19-strukturiert-tagesgenau.xml"


doc = TeiReader(main_file)
places = doc.any_xpath('.//tei:place')
ns = {
    "tei": "http://www.tei-c.org/ns/1.0"
}


story_map_data = {
    "storymap": {
        "call_to_action": True,
        "call_to_action_text": "",
        "map_as_image": False,
        "zoomify": True,
        "map_type": "",
        "map_subdomains": "",
        "attribution": "",
        "slides": []
    }   
}


def get_name(node):
    return " ".join(node.xpath('./tei:placeName/text()', namespaces=ns)[0].split())


no_match = set()
for i, x in enumerate(places):
    cur_date = x.xpath('.//ancestor::tei:event[1]', namespaces=ns)[0].attrib['when']
    if '1925' in cur_date:
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
            slide['text'] = {
                'headline': name
            }
            akon = x.xpath('.//tei:link', namespaces=ns)[0].attrib['target']
            if akon is not None:
                slide['media'] = {
                    "caption": f"Postkarte von {name}",
                    "credit": "ÖNB",
                    "url": f"{akon}"
                }
            lat, lon = x.xpath('.//tei:geo/text()', namespaces=ns)[0].split()
            try:
                slide["location"] = {
                    "lat": float(lat),
                    "line": True,
                    "lon": float(lon),
                    "zoom": 12
                }
            except ValueError:
                continue
            slide['date'] = x.xpath('.//ancestor::tei:event[1]', namespaces=ns)[0].attrib['when']
            story_map_data['storymap']['slides'].append(slide)
        


with open('./html/data/story_map.json', 'w') as f:
    json.dump(story_map_data, f)





