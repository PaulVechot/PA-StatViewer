<sv-results-list>
    <div class="table-responsive">
        <table class="table table-striped table-sm">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Data sources</th>
                    <th>Configuration set</th>
                    <th>View details</th>
                </tr>
            </thead>
            <tbody>
                <tr each={ opts.results }>
                    <td>{ new Date(date).toLocaleDateString() }</td>
                    <td>
                        <ul>
                            <li each={ datasources }>{ label }</li>
                        </ul>
                    </td>
                    <td>{ configset }</td>
                    <td><a href="/app/stats/stats.html?resultId={ id }">
                            <span data-feather="eye"></span>
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    // Icons
    this.on('mount', function () {
        feather.replace()
    });
</sv-results-list>
