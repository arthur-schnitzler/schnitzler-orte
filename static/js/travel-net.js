document.addEventListener('DOMContentLoaded', function () {
    var options = {
        chart: {
            type: 'networkgraph'
        },
        title: {
            text: ""
          },
        plotOptions: {
            networkgraph: {
                layoutAlgorithm: {
                    enableSimulation: true
                }
            }
        },
        series: [
            {
                accessibility: {
                    enabled: false
                },
                turboThreshold: 0,
                marker: {
                    radius: 10
                },
                dataLabels: {
                    enabled: true,
                    linkFormat: '',
                    allowOverlap: false
                },
            }
        ]
    };
    Highcharts.ajax({
        url: 'data/travels.json',
        success: function (data) {
            const origData = JSON.parse(data).data;
            const filteredData = origData.filter(obj => obj.amount > 2);
            console.log(filteredData.length)

            var networkData = filteredData.map(function (obj) {
                return {"from": obj.source, "to": obj.target};
            });
            console.log(networkData)

            options.series[0].data = networkData;
            Highcharts.chart('hc_container', options);
        }
    });
});


// Highcharts.chart('hc_container', {
//     chart: {
//       type: 'networkgraph'
//     },
  
//     plotOptions: {
//       networkgraph: {
//         layoutAlgorithm: {
//           enableSimulation: true
//         }
//       }
//     },
//     series: [{
//       dataLabels: {
//         enabled: true
//       },
//       data: [{
//           from: 'Europe',
//           to: 'UK'
//         },
//         {
//           from: 'Europe',
//           to: 'Poland'
//         },
//         {
//           from: 'Europe',
//           to: 'Italy',
//           color: 'orange'
//         },
//         {
//           from: 'UK',
//           to: 'London'
//         },
//         {
//           from: 'UK',
//           to: 'Bristol'
//         },
//         {
//           from: 'London',
//           to: 'London Centre'
//         },
//         {
//           from: 'Poland',
//           to: 'Warsaw'
//         },
//         {
//           from: 'Poland',
//           to: 'Krakow',
//           color: 'red'
//         },
//         {
//           from: 'Italy',
//           to: 'Roma'
//         },
//         {
//           from: 'Italy',
//           to: 'Piza'
//         }
//       ]
//     }]
//   });
  