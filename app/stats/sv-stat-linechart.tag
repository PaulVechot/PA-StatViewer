<sv-stat-linechart>
    <div height='400'>
        <canvas class="my-4 w-100" ref="linechart" id="linechart"></canvas>
    </div>

    <script>
        var refs = this.refs;

        this.on('mount', renderChart);

        function renderChart () {
            var ctx = refs.linechart;
            var labels = getChartLabels();
            var datasets = buildDataSets();

            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: datasets
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: false
                            }
                        }]
                    },
                    legend: {
                        display: true,
                    }
                }
            });
        }

        function getChartLabels () {
            for (var dataset of opts.stat.datasets) {
                if (dataset.label === 'labels') {
                    return dataset.data;
                }
            }

            return null;
        }

        function buildDataSets () {
            var datasetColors = [ '#007bff', '#ff007b', '#7b00ff' ]
            var colorIndex = 0;
            var datasets = [];
            for (var dataset of opts.stat.datasets) {
                if (dataset.label !== 'labels') {
                    datasets.push({
                        data: dataset.data,
                        label: dataset.label,
                        lineTension: 0,
                        backgroundColor: 'transparent',
                        borderColor: datasetColors[colorIndex],
                        borderWidth: 4,
                        pointBackgroundColor: datasetColors[colorIndex]
                    });
                    colorIndex = colorIndex + 1 % datasetColors.length;
                }
            }

            return datasets;
        }
    </script>
</sv-stat-linechart>
