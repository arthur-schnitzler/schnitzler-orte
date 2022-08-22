(async () => {

    const topology = await fetch(
      'https://code.highcharts.com/mapdata/custom/europe.topo.json'
    ).then(response => response.json());
  
    const data = await fetch(
      'data/heatmap.json'
    ).then(response => response.json());
  
    data.forEach(p => {
      p.z = p.count;
      p.lon = p.lng
    });
    
    const filteredDate = data.filter(word => word.count > 2);

  
    const H = Highcharts;
  
    const chart = Highcharts.mapChart('container', {
      title: {
        text: ""
      },
      mapNavigation: {
        enabled: true,
        enableDoubleClickZoomTo: true
    },
  
      tooltip: {
        pointFormat: '{point.count} Besuche: in <strong>{point.name}</strong>'
      },
  
      xAxis: {
        crosshair: {
          zIndex: 5,
          dashStyle: 'dot',
          snap: false,
          color: 'gray'
        }
      },
  
      yAxis: {
        crosshair: {
          zIndex: 5,
          dashStyle: 'dot',
          snap: false,
          color: 'gray'
        }
      },
  
      series: [{
        name: 'Basemap',
        mapData: topology,
        accessibility: {
          exposeAsGroupOnly: true
        },
        borderColor: '#606060',
        nullColor: 'rgba(200, 200, 200, 0.2)',
        showInLegend: false
      }, {
        type: 'mapbubble',
        accessibility: {
          point: {
            valueDescriptionFormat: '{point.count} Besuche in: {point.name}'
          }
        },
        name: 'Schnitzlers Aufenthalte',
        data: filteredDate,
        maxSize: '7%',
        color: '#c34528'
      }]
    });
  
  
  
  })();
  