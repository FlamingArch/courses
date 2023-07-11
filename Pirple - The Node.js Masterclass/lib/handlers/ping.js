/**
 * Represents a handler for a /ping path.
 * @param {string} data - The data passed to the HTTP method
 * @param {string} author - Callback function with status code and payload received passed as a param.
 *
 * Data param is ignored for this route.
 * This route returns a status code of 200 and no payload.
 */
function ping(data, callback) {
  callback(200);
}

module.exports = ping;
