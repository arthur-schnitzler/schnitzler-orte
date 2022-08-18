function* range(start, end, step) {
    let state = start;
    while (state < end) {
        yield state;
        state += step;
    }
    return;
};

function handleSelectChange(event) {
    if (document.getElementById('storydiv')) {
        document.getElementById('storydiv').remove();
    }
    var selectElement = event.target;
    var value = selectElement.value;
    var storymap_data = `data/${value}.json`;
    document.getElementById('year').innerHTML = value;
    var storydiv = document.createElement('div');
    storydiv.setAttribute('id', 'storydiv');
    document.getElementById('mapdiv').append(storydiv);
    var storymap = new KLStoryMap.StoryMap('storydiv', storymap_data, {});
    window.onresize = function(event) {
        storymap.updateDisplay();
    }
}