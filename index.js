/**
 * Main JS entry point, loaded from index.html
 */

init();

/**
 * App init function. Redirects to login page if needed
 */
function init () {
    if (sessionStorage.getItem('session') === null) {
        window.location = 'app/login/login.html';
    } else {
        window.location = 'app/results/results.html';
    }
}
