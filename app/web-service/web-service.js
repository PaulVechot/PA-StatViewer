var instance = null;

/** Class for interfacing with the web-service */
class WebService {

    /**
     * Returns single instance, creating it if needed
     */
    constructor () {
        if (!instance) {
            instance = this;
        }

        return instance;
    }

    /**
     * Logs into web-service using passed credentials
     * @param {string} username - The username to log in with
     * @param {string} password - The password to log in with
     * @param {string} callback - The callback to call on success
     */
    login (username, password, callback) {
        var data = JSON.stringify({ username: username, password: password });
        $.ajax('/web-service/session', {
            data: data,
            contentType: 'application/json',
            type: 'POST',
            success: callback
        });
    }

    /**
     * Logs into web-service using passed credentials
     * @param {string} sessionToken - The session token for logging out
     * @param {string} callback - The callback to call on success
     */
    logout (sessionToken, callback) {
        $.ajax('/web-service/session/' + sessionToken, {
            type: 'DELETE',
            success: callback
        });
    }

    /**
     * Fetches analysis results from the web-service
     * @param {string} jwt - The JWT cookie
     * @param {string} callback - The callback to call on success
     */
    fetchResults (jwt, callback) {
        $.get('/web-service/results', { jwt: jwt }, callback);
    }

    /**
     * Fetches stats related to an analysis result from the web-service
     * @param {string} jwt - The JWT cookie
     * @param {number} resultId - The ID of the analysis result
     * @param {string} callback - The callback to call on success
     */
    fetchStats (jwt, resultId, callback) {
        $.get('/web-service/results/' + resultId, { jwt: jwt }, callback);
    }
}
