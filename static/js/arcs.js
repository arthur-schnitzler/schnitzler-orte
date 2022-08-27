const { DeckGL, ArcLayer } = deck;

const greatCircleLayer = new ArcLayer({
    id: 'great-circle',
    data:'data/arc-data.json',
    getSourcePosition: d => d.from.coordinates,
    getTargetPosition: d => d.to.coordinates,
    getSourceColor: [64, 255, 0],
    getTargetColor: [0, 128, 200],
    widthMinPixels: 1,
    getTilt: 10,
    pickable: true
});

new DeckGL({
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
    controller: true,
    layers: [greatCircleLayer],
    getTooltip: ({ object }) => object && `Von ${object.from.name} nach ${object.to.name} am ${object.from.day}`
});