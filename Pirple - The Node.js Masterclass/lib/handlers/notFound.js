/**
 * Represents a handler for all remaining unhandled (404) paths.
 * @param {string} data - The data passed to the HTTP method
 * @param {string} author - Callback function with status code and payload received passed as a param.
 *
 * Data param is ignored for this route.
 * This route returns a status code of 404 and no payload.
 */
function notFound(data, callback) {
  callback(404);
}

module.exports = notFound;
