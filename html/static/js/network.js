const container = document.getElementById("viscontainer");
// const url = 'https://raw.githubusercontent.com/jacomyal/sigma.js/main/examples/clusters-labels/euroSIS.json'

const url = "./data/network.json"

d3.json(url)
    .then(response => {
        data = response;
        console.log(data);
        const graph = graphology.Graph.from(data);
        const OPTIONS = {
          allowInvalidContainer: true,
      }
      
      const renderer = new Sigma(graph, container, OPTIONS);
    });


// graph.addNode("John", { size: 5, label: "John", color: "blue" });
// graph.addNode("Mary", { size: 3, label: "Mary", color: "red" });
// graph.addNode("hansi", { size: 3, label: "hansi", color: "yellow" });

// graph.addEdge("John", "Mary");
// graph.addEdge("John", "hansi");
// graph.addEdge("John", "hansi");




// graph.nodes().forEach((node, i) => {
//   const angle = (i * 2 * Math.PI) / graph.order;
//   graph.setNodeAttribute(node, "x", 100 * Math.cos(angle));
//   graph.setNodeAttribute(node, "y", 100 * Math.sin(angle));
// });
// console.log(graph);

