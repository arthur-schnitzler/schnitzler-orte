const container = document.getElementById("viscontainer");
// const url = 'https://raw.githubusercontent.com/jacomyal/sigma.js/main/examples/clusters-labels/euroSIS.json'

const url = "./data/network.json"
const state = { searchQuery: "" };
const searchInput = document.getElementById("search-input")
const searchSuggestions = document.getElementById("suggestions");
const OPTIONS = {
    allowInvalidContainer: true,
    enableEdgeHoverEvents: "debounce",
}



function showPopUp(nodeId, graph) {
    const options = { focus: true }
    var myModalPayload = `
  <div>
      ${graph.getNodeAttribute(nodeId, "akon") === 'no url'
            ? 'kein Bild vorhanden'
            : `<img src="${graph.getNodeAttribute(nodeId, "akon")}" class="img-thumbnail"/>`
        }
  </div>
  
  <div>
      <a target="_blank" href="${graph.getNodeAttribute(nodeId, "schnitzler_tagebuch")}" class="badge rounded-pill bg-success" style="color: white">Schnitzler Tagebuch</a>
  </div>
  <div>
      ${graph.getNodeAttribute(nodeId, "schnitzler_briefe") === 'no url'
            ? ''
            :`<a target="_blank" href="${graph.getNodeAttribute(nodeId, "schnitzler_briefe")}" class="badge rounded-pill bg-danger">Schnitzler Briefe</a>` 
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

        searchSuggestions.innerHTML = graph
            .nodes()
            .map((node) => `<option value="${graph.getNodeAttribute(node, "label")}"></option>`)
            .join("\n");

        function setSearchQuery(query) {
            state.searchQuery = query;

            if (searchInput.value !== query) searchInput.value = query;

            if (query) {
                const lcQuery = query.toLowerCase();
                const suggestions = graph
                    .nodes()
                    .map((n) => ({ id: n, label: graph.getNodeAttribute(n, "label") }))
                    .filter(({ label }) => label.toLowerCase().includes(lcQuery));

                // If we have a single perfect match, them we remove the suggestions, and
                // we consider the user has selected a node through the datalist
                // autocomplete:
                if (suggestions.length === 1 && suggestions[0].label === query) {
                    state.selectedNode = suggestions[0].id;
                    state.suggestions = undefined;

                    // Move the camera to center it on the selected node:
                    const nodePosition = renderer.getNodeDisplayData(state.selectedNode);
                    renderer.getCamera().animate(nodePosition, {
                        duration: 500,
                    });
                }
                // Else, we display the suggestions list:
                else {
                    state.selectedNode = undefined;
                    state.suggestions = new Set(suggestions.map(({ id }) => id));
                }
            }
            // If the query is empty, then we reset the selectedNode / suggestions state:
            else {
                state.selectedNode = undefined;
                state.suggestions = undefined;
            }

            // Refresh rendering:
            renderer.refresh();
        }

        function setHoveredNode(node) {
            if (node) {
                state.hoveredNode = node;
                state.hoveredNeighbors = new Set(graph.neighbors(node));
            } else {
                state.hoveredNode = undefined;
                state.hoveredNeighbors = undefined;
            }

            // Refresh rendering:
            renderer.refresh();
        }
        searchInput.addEventListener("input", () => {
            setSearchQuery(searchInput.value || "");
        });
        searchInput.addEventListener("blur", () => {
            setSearchQuery("");
        });


        const renderer = new Sigma(graph, container, OPTIONS);
        renderer.on("enterNode", ({ node }) => {
            setHoveredNode(node);
        });
        renderer.on("leaveNode", () => {
            setHoveredNode(undefined);
        });
        renderer.setSetting("nodeReducer", (node, data) => {
            const res = { ...data };

            if (state.hoveredNeighbors && !state.hoveredNeighbors.has(node) && state.hoveredNode !== node) {
                res.label = "";
                res.color = "#f6f6f6";
            }

            if (state.selectedNode === node) {
                res.highlighted = true;
            } else if (state.suggestions && !state.suggestions.has(node)) {
                res.label = "";
                res.color = "#f6f6f6";
            }

            return res;
        });

        renderer.on('clickNode', ({ node }) => showPopUp(node, graph));
    });

