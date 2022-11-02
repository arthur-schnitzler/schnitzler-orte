import json
import pandas as pd
import networkx as nx
from random import randint


df = pd.read_csv('hansi.csv')
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
        "attributes": edge_dict
    }
    data["edges"].append(item)

with open("./html/data/network.json", 'w') as f:
    json.dump(data, f, ensure_ascii=False)