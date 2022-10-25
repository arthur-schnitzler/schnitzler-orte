const { DeckGL, ColumnLayer } = deck;

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

    const columnlayer = new ColumnLayer({
        id: 'column-layer',
        data,
        diskResolution: 6,
        radius: 3500,
        extruded: true,
        pickable: true,
        elevationScale: 50,
        getPosition: d => d.centroid,
        getFillColor: d => [d.value / 50, 250, d.value / 100, 255],
        getLineColor: [0, 0, 0],
        getElevation: d => d.value,
        autoHighlight: true,
        ...options
    });

    deckgl.setProps({
        layers: [columnlayer],
        // getTooltip: ({ object }) => object && `${object.name}, Tage: ${object.value}`,
        getTooltip: ({object}) => object && {
            html: `
            <h2>
                <a href="${object.pmb}">${object.name}</a>
            </h2>
            <div>Tage: ${object.value}</div>
            <div>
                <img src="${object.image}" class="img-thumbnail"/>
            </div>`,
            style: {
              backgroundColor: '#ffffff'
            }
          }
    });
}

d3.csv('data/places.csv')
    .then(response => {
        data = response.map(
            d => ({
                "centroid": [
                    Number(d.lng), Number(d.lat),
                ],
                "value": Number(d.amount),
                "name": d.name,
                "pmb": d.pmb,
                "image": d.image
            })
        );
        renderLayer();
    });