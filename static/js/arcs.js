const { DeckGL, ArcLayer, DataFilterExtension } = deck;

const deckgl = new DeckGL({
    container: 'viscontainer',
    mapStyle: 'https://basemaps.cartocdn.com/gl/dark-matter-nolabels-gl-style/style.json',
    initialViewState: {
        longitude: 10.4356549,
        latitude: 48.9833712,
        zoom: 5,
        minZoom: 1,
        maxZoom: 15,
        pitch: 45
    },
    controller: true,
});

let data = null;
const OPTIONS = ['getWidth', 'getHeight'];

OPTIONS.forEach(key => {
    document.getElementById(key).oninput = renderLayer;
});
document.getElementById('filter-min').oninput = renderLayer;
document.getElementById('filter-max').oninput = renderLayer;
document.getElementById('searchPlaceInput').oninput = renderLayer
document.getElementById('searchAdesseInput').oninput = renderLayer


function renderLayer() {
    const options = {};
    const minVal = document.getElementById('filter-min').value;
    document.getElementById('filter-min-value').innerHTML = minVal;
    const maxVal = document.getElementById('filter-max').value;
    document.getElementById('filter-max-value').innerHTML = maxVal;
    OPTIONS.forEach(key => {
        const value = document.getElementById(key).value;
        document.getElementById(key + '-value').innerHTML = value;
        options[key] = Number(value);
    });
    const searchString = document.getElementById('searchPlaceInput').value;
    const searchAdresse = document.getElementById('searchAdesseInput').value;

    // Filter data by search strings and year range
    const myData = data.filter(function (el) {
        const year = Number(el.from.year);
        const yearInRange = (year === 0) || (year >= Number(minVal) && year <= Number(maxVal));
        return el.from.name.includes(searchString) &&
               el.to.name.includes(searchAdresse) &&
               yearInRange;
    });

    const greatCircleLayer = new ArcLayer({
        id: 'great-circle',
        data: myData,
        greatCircle: true,
        getSourcePosition: d => d.from.coordinates,
        getTargetPosition: d => d.to.coordinates,
        getSourceColor: [64, 255, 0],
        getTargetColor: [0, 128, 200],
        widthMinPixels: 1,
        getTilt: 2,
        pickable: true,
        autoHighlight: true,
        ...options
    });

    deckgl.setProps({
        layers: [greatCircleLayer],
        getTooltip: ({ object }) => object && `Von ${object.from.name} nach ${object.to.name} am ${object.from.day}`
    });
}

d3.json('data/arc-data.json')
    .then(response => {
        data = response;
        renderLayer();
    });
