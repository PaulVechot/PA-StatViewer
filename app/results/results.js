/**
 * Results view controller
 */

/* globals riot: false, WebService: false */

var results = null;

fetchResults();

/**
 * Stores results and mounts results table tag
 * @param {Object} data - The fetched data
 */
function assignResults (data) {
    results = data;
    riot.mount('sv-results-list', { results: results });
}

/**
 * Fetches analysis results from web-service, calling assignResults on success
 */
function fetchResults () {
    var session = JSON.parse(sessionStorage.getItem('session'));
    new WebService().fetchResults(session.token, assignResults);
}
