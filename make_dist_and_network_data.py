import os
import json
import pandas as pd

from collections import Counter

from acdh_tei_pyutils.tei import TeiReader
from geopy import distance

from config import MASTER_FILE, NAME_SPACES

main_file = MASTER_FILE
ns = NAME_SPACES


print(f"running {os.path.basename(__file__)}")

def get_distance(row):
    """ helper function to calculate distance from lat/lng columns in dataframe """
    if row['name'] == row['next_name']:
        dist = 0
    else:
        point_a = (row['lat'], row['lng'])
        point_b = (row['next_lat'], row['next_lng'])
        dist = distance.distance(point_a, point_b).km
    return dist

doc = TeiReader(main_file)
places = doc.any_xpath('.//tei:place')
df_data = {
    "name": [],
    "lat": [],
    "lng": [],
    "day": []
}
for x in places:
    coords = x.xpath('.//tei:geo', namespaces=ns)[0].text
    try:
        lat, lng = coords.split()[0:2]
    except AttributeError:
        continue
    try:
        df_data['lat'].append(float(lat))
        df_data['lng'].append(float(lng))
    except ValueError:
        continue
    df_data["name"].append(" ".join(x.xpath('.//tei:placeName', namespaces=ns)[0].text.split()))
    df_data["day"].append(x.getparent().getparent().getparent().attrib['when'])

df = pd.DataFrame(df_data)
# add values from next row to the current one
df = pd.concat([
   df, 
   df.shift(-1).add_prefix('next_'), 
], axis=1).fillna(0.0)

# drop last row
df.drop(
    index=df.index[-1], 
        axis=0, 
        inplace=True
)

# drop rows without movement
df.drop(df.loc[df['name'] == df['next_name']].index, inplace=True)

# create arc-data

data = []
for i, row in df.iterrows():
    item = {}
    item['from'] = {
        "name": row['name'],
        "day": row['day'],
        "coordinates": [
            row['lng'],
            row['lat']
        ]
    }
    item['to'] = {
        "name": row['next_name'],
        "coordinates": [
            row['next_lng'],
            row['next_lat']
        ]
    }
    data.append(item)
with open ('./html/data/arc-data.json', 'w') as f:
    json.dump(data, f, ensure_ascii=False)


# create travel-net-map.json data
graph_data = []
for g, gdf in df.groupby('name'):
    row = gdf.iloc[0]
    item = {}
    item['properties'] = {
        "id": g,
        "lat": row["lat"],
        "lon": row["lng"]
    }
    item['connections'] = {}
    for target, tdf in gdf.groupby('next_name'):
        item['connections'][target] = len(tdf)
    graph_data.append(item)

with open ('./html/data/travel-net-map.json', 'w') as f:
    json.dump(graph_data, f, ensure_ascii=False)

# calculate distance
df['distance'] = df.apply(lambda row : get_distance(row), axis = 1)

# save data for deck.gl hexagon layer
df.to_csv('./html/data/places.csv', index=False)

travels = []
for i, row in df.iterrows():
    travels.append(
        "___".join(
            [row['name'], row['next_name'], str(row['distance'])]
        )
    )
travels = dict(Counter(travels).most_common())
better_travels = []
for key, value in travels.items():
    source, target, distance = key.split('___')
    better_travels.append(
        {
            "travel_id": f"{source}___{target}",
            "source": source,
            "target": target,
            "distance": float(distance),
            "amount": value
        }
    )
data = {
    "data": better_travels
}
with open ('./html/data/travels.json', 'w') as f:
    json.dump(data, f, ensure_ascii=False)


