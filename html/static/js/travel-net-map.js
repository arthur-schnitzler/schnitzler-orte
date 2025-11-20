// taken from https://github.com/danwild/leaflet-network

console.log('travel-net-map.js loading, L.networkLayer is', typeof L.networkLayer);
console.log('travel-net-map.js loading, L.NetworkLayer is', typeof L.NetworkLayer);

// Save reference to both L.NetworkLayer and L.networkLayer before they get overwritten by StoryMap
var NetworkLayerClass = L.NetworkLayer;
var networkLayerConstructor = L.networkLayer;

function init(data){

		//var map = L.map('map').setView([-25, 134], 5);

		// create a basemap
		var canvas = L.tileLayer('https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png', {
			attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> &copy; <a href="http://cartodb.com/attributions">CartoDB</a>',
			subdomains: 'abcd',
			maxZoom: 19
		});

		// setup our leaflet map
		var map = L.map('map', {
			layers: [ canvas ],
			center: L.latLng(48, 16),
			zoom: 9
		});

		// create a layer control so we can show/hide network layer
		var layerControl = L.control.layers();
		layerControl.addTo(map);

		var globalWeightMode = true;

		// init the network layer using saved global reference
		console.log('In init, window.leafletNetworkLayer is', typeof window.leafletNetworkLayer);
		console.log('In init, window.LeafletNetworkLayer is', typeof window.LeafletNetworkLayer);

		if (typeof window.leafletNetworkLayer !== 'function') {
			console.error('window.leafletNetworkLayer is not available!');
			return;
		}

		var networkLayer = window.leafletNetworkLayer({

			data: data,
			globalWeightMode: globalWeightMode,

			onMouseEnterNode: function(node){
				var count = Object.values(node.connections).filter(v => v).length;
				var content = `ID: ${node.properties.id}, Source for: ${count}`;
				$("#tooltip").html(content);
				$("#tooltip").show();
			},

			onMouseLeaveNode: function(node){
				$("#tooltip").html();
				$("#tooltip").hide();
			},

			onMouseEnterLine: function(){
				console.log('Connection weight: ' + $(this).data('weight'));
			}
		});

		// add network layer to the map (enabled by default)
		map.addLayer(networkLayer);

		// add layer as an overlay (already added, so checkbox will be checked)
		layerControl.addOverlay(networkLayer, 'Network Example');

		// example of changin displayMode option
		$('input[type=radio][name=mode]').change(function(){
			networkLayer.setDisplayMode(this.value);
		});

		// example clear selection
		$('#clear').click(() => {
			networkLayer.setTarget(null);
		});

		// example setOptions
		$('#toggleScope').click(() => {
			globalWeightMode = !globalWeightMode;
			networkLayer.setOptions({ globalWeightMode: globalWeightMode });
		});
}

$(document).ready(function(){
	$.get('data/travel-net-map.json', function(data, resType){
		if(resType == 'success'){
			init(data);
		}
		else {
			console.log('failed to load data');
		}
	});
});