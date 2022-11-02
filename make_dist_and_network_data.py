import os
import json
import pandas as pd
import networkx as nx

from collections import Counter
from random import randint
from acdh_tei_pyutils.tei import TeiReader
from geopy import distance

from config import MASTER_ENRICHED, NAME_SPACES

main_file = MASTER_ENRICHED
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
domains = [
    "gnd",
    "schnitzler_bahr",
    "schnitzler_briefe",
    "legalkraus",
    "schnitzler_tagebuch",
    "wikidata"    
]

df_data = {
    "name": [],
    "lat": [],
    "lng": [],
    "day": [],
    "pmb": [],
    "akon": [],
    "gnd": [],
    "schnitzler_tagebuch": [],
    "schnitzler_bahr": [],
    "schnitzler_briefe": [],
    "legalkraus": [],
    "wikidata": []
}
for x in places:
    pl_name = " ".join(x.xpath('.//tei:placeName', namespaces=ns)[0].text.split())
    try:
        coords = x.xpath('.//tei:geo', namespaces=ns)[0].text
    except IndexError:
        print(f"looks like place {pl_name} has no coords")
        continue
    try:
        lat, lng = coords.split()[0:2]
    except AttributeError:
        continue
    try:
        df_data['lat'].append(float(lat))
        df_data['lng'].append(float(lng))
    except ValueError:
        continue
    for domain in domains:
        try:
            uri = x.xpath(f'./tei:idno[@subtype="{domain}"]/text()', namespaces=ns)[0]
        except IndexError:
            uri = "no_url"
        df_data[domain].append(uri)
    try:
        akon = x.xpath('./tei:link/@target', namespaces=ns)[0]
    except IndexError:
        akon = "no url"
    df_data["akon"].append(akon)
    try:
        pmb = x.xpath('./tei:idno[@type="pmb"]/text()', namespaces=ns)[0]
    except IndexError:
        pmb = "no url"
    df_data["pmb"].append(pmb)
    
    df_data["name"].append(pl_name)
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
df.to_csv('hansi.csv', index=False)
domains = [
    "gnd",
    "schnitzler_bahr",
    "schnitzler_briefe",
    "legalkraus",
    "schnitzler_tagebuch",
    "wikidata",
    "pmb"
]

G = nx.Graph()
for i, row in df.iterrows():
    G.add_node(row['name'])
    for domain in domains:
        G.nodes[row['name']][domain] = row[domain]
for i, row in df.iterrows():
    G.add_edge(row['name'], row['next_name'])
    G.edges[row['name'], row['next_name']]["day"] = row["day"]
    G.edges[row['name'], row['next_name']]["key"] = f"edge_key__{i}"

# add network coords
pos = nx.spring_layout(G, iterations=30, seed=1721)
for key, value in pos.items():
    G.nodes[key]['x'] = float(value[0])
    G.nodes[key]['y'] = float(value[1])

# add node size taken from centrality
degree_centrality = nx.centrality.degree_centrality(G)
for key, value in degree_centrality.items():
    G.nodes[key]['centrality'] = value * 100

# add cluster and colors
for com in nx.community.label_propagation_communities(G):
    color = "#%06X" % randint(0, 0xFFFFFF)  # creates random RGB color
    for node in list(com):  # fill colors list with the particular color for the community nodes
        G.nodes[node]["color"] = color

# serialize into graphology format
data = {
    "attributes": {},
    "options": {
        "type": "undirected",
        "multi": True,
        "allowSelfLoops": True
    },
    "nodes": [],
    "edges": []
}

for node in nx.nodes(G):
    item = {
        "key": node,
        "attributes": dict(G.nodes[node])
    }
    data["nodes"].append(item)

for edge in nx.edges(G):
    edge_dict = dict(G.edges[edge])
    item = {
        "key": edge_dict['key'],
        "source": edge[0],
        "target": edge[1],
        "attributes": edge_dict["day"]
    }
    data["edges"].append(item)

with open("./html/data/network.json", 'w') as f:
    json.dump(data, f, ensure_ascii=False)

# create arc-data

data = []
for i, row in df.iterrows():
    item = {}
    item['from'] = {
        "name": row['name'],
        "day": row['day'],
        "year": row['day'][:4],
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


