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

# drop rows without movement
df.drop(df.loc[df['name'] == df['next_name']].index, inplace=True)

# calculate distance
df['distance'] = df.apply(lambda row : get_distance(row), axis = 1)
df.drop(
    index=df.index[-1], 
        axis=0, 
        inplace=True
)

# df.to_csv('hansi.csv', index=False)

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


