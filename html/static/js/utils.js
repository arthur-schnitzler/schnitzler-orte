function* range(start, end, step) {
    let state = start;
    while (state < end) {
        yield state;
        state += step;
    }
    return;
};

function handleSelectChange(event) {
    var selectElement = event.target;
    var value = selectElement.value;
    var storymap_data = `data/${value}.json`;
    document.getElementById("year").innerHTML = value;
    var storymap = new KLStoryMap.StoryMap('mapdiv', storymap_data, {});
    window.onresize = function(event) {
        storymap.updateDisplay();
    }
}