const container = document.getElementById("viscontainer");
// const url = 'https://raw.githubusercontent.com/jacomyal/sigma.js/main/examples/clusters-labels/euroSIS.json'

const url = "./data/network.json"

function logEvent(nodeId, graph) {
  const label = graph.getNodeAttribute(nodeId, "label")
  console.log(nodeId, label)
}

function showPopUp(nodeId, graph){
  const options = {focus: true}
  var myModalPayload = `
  <div>
      ${
          graph.getNodeAttribute(nodeId, "akon") === 'no url'
          ? 'kein Bild vorhanden'
          : `<img src="${graph.getNodeAttribute(nodeId, "akon")}" class="img-thumbnail"/>`
      }
  </div>
  
  <div>
      <a target="_blank" href="${graph.getNodeAttribute(nodeId, "schnitzler_tagebuch")}" class="badge rounded-pill bg-success" style="color: white">Schnitzler Tagebuch</a>
  </div>
  <div>
      ${
          graph.getNodeAttribute(nodeId, "schnitzler_briefe") ? `<a target="_blank" href="${graph.getNodeAttribute(nodeId, "schnitzler_briefe")}" class="badge rounded-pill bg-danger">Schnitzler Briefe</a>` : ''
      }
  </div>`;
  var myModal = new bootstrap.Modal(document.getElementById('myModal'), options);
  document.getElementById('myModalLabel').innerHTML = `${graph.getNodeAttribute(nodeId, "label")}`
  document.getElementById('modalBody').innerHTML = myModalPayload
  myModal.toggle();
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
      renderer.on('clickNode', ({ node }) => showPopUp(node, graph));
    });



