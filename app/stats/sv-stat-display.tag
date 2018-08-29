<sv-stat-display>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap
    align-items-center pt-3 mb-3 { pb-2: stat.representation != 'table' }
    { border-bottom: stat.representation != 'table' }">

        <h1 class="h2">{ stat.label }</h1>
    </div>

    <sv-stat-table stat="{ stat }"
        if={ stat.representation == 'table' }></sv-stat-table>
    <sv-stat-linechart stat="{ stat }"
        if={ stat.representation == 'linechart' }></sv-stat-linechart>

    this.stat = opts.stat;
</sv-stat-display>
