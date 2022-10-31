const container = document.getElementById("viscontainer");
const graph = new graphology.Graph({multi: true});

graph.addNode("John", { size: 5, label: "John", color: "blue" });
graph.addNode("Mary", { size: 3, label: "Mary", color: "red" });
graph.addNode("hansi", { size: 3, label: "hansi", color: "yellow" });

graph.addEdge("John", "Mary");
graph.addEdge("John", "hansi");
graph.addEdge("John", "hansi");




graph.nodes().forEach((node, i) => {
  const angle = (i * 2 * Math.PI) / graph.order;
  graph.setNodeAttribute(node, "x", 100 * Math.cos(angle));
  graph.setNodeAttribute(node, "y", 100 * Math.sin(angle));
});
console.log(graph);

const OPTIONS = {
    allowInvalidContainer: true,

}

const renderer = new Sigma(graph, container, OPTIONS);
