const { DeckGL, HexagonLayer } = deck;

const deckgl = new DeckGL({
    container: 'viscontainer',
    mapStyle: 'https://basemaps.cartocdn.com/gl/dark-matter-nolabels-gl-style/style.json',
    initialViewState: {
        longitude: 15.8377883,
        latitude: 47.6980143,
        zoom: 10,
        minZoom: 1,
        maxZoom: 15,
        pitch: 60.5
    },
    controller: true
});

let data = null;

const OPTIONS = ['radius', 'coverage', 'upperPercentile'];

const COLOR_RANGE = [
    [1, 152, 189],
    [73, 227, 206],
    [216, 254, 181],
    [254, 237, 177],
    [254, 173, 84],
    [209, 55, 78]
];

OPTIONS.forEach(key => {
    document.getElementById(key).oninput = renderLayer;
});

function renderLayer() {
    const options = {};
    OPTIONS.forEach(key => {
        const value = document.getElementById(key).value;
        document.getElementById(key + '-value').innerHTML = value;
        options[key] = Number(value);
    });

    const hexagonLayer = new HexagonLayer({
        id: 'heatmap',
        colorRange: COLOR_RANGE,
        data,
        radius: 1500,
        elevationRange: [0, 1000],
        elevationScale: 250,
        extruded: true,
        getPosition: d => d,
        ...options
    });

    deckgl.setProps({
        layers: [hexagonLayer]
    });
}

d3.csv('data/places.csv')
    .then(response => {
        data = response.map(d => [Number(d.lng), Number(d.lat)]);
        renderLayer();
    });