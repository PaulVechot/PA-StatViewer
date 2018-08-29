/**
 * Stats view controller
 */

/* globals URLSearchParams: false, riot: false, Chart: false */
/* globals WebService: false */

var stats = null;

fetchStats();

/**
 * Stores stats and mounts stat display tags
 * @param {Object} data - The fetched data
 */
function assignStats (data) {
    stats = data;
    riot.mount('sv-stats', { stats: stats });
}

/**
 * Fetches analysis results from web-service, calling assignResults on success
 */
function fetchStats () {
    var searchParams = new URLSearchParams(window.location.search.substr(1));
    var resultId = searchParams.get('resultId');
    new WebService().fetchStats('JWT STUB', resultId, assignStats);
}
