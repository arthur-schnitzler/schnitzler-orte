const container = document.getElementById("viscontainer");
// const url = 'https://raw.githubusercontent.com/jacomyal/sigma.js/main/examples/clusters-labels/euroSIS.json'

const url = "./data/network.json"

function logEvent(item, graph) {
  const label = graph.getNodeAttribute(item, "label")
  console.log(item, label)
}

d3.json(url)
    .then(response => {
        data = response;
        console.log(data);
        const graph = graphology.Graph.from(data);
        const OPTIONS = {
          allowInvalidContainer: true,
          enableEdgeHoverEvents: "debounce",
      }
      
      const renderer = new Sigma(graph, container, OPTIONS);
      renderer.on('clickNode', ({ node }) => logEvent(node, graph));
    });



