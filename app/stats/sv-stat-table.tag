<sv-stat-table>
    <div class="table-responsive">
        <table class="table table-striped table-sm">
            <thead>
                <tr>
                    <th each={ header in headers }>{ header }</th>
                </tr>
            </thead>
            <tbody>
                <tr each={ row in rows }>
                    <td each={ data in row }>{ data }</td>
                </tr>
            </tbody>
        </table>
    </div>

    <script>
        this.headers = getHeaders();
        this.rows = buildRows();

        function getHeaders () {
            var headers = [];

            for (var dataset of opts.stat.datasets) {
                if (dataset.label === 'labels') {
                    return dataset.data;
                }
            }

            return null;
        }

        function buildRows () {
            var rows = [];
            var i;

            for (var dataset of opts.stat.datasets) {
                if (dataset.label !== 'labels') {
                    for (i = 0; i < dataset.data.length; i++) {
                        rows.push([]);
                    }
                    break;
                }
            }

            for (var dataset of opts.stat.datasets) {
                if (dataset.label !== 'labels') {
                    for (i = 0; i < dataset.data.length; i++) {
                        rows[i].push(dataset.data[i]);
                    }
                }
            }

            return rows;
        }
    </script>
</sv-stat-table>
