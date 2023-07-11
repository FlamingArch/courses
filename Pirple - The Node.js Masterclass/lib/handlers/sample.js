/**
 * Represents a handler for /sample path.
 * @param {string} data - The data passed to the HTTP method
 * @param {string} author - Callback function with status code and payload received passed as a param.
 *
 * - Data param is Unnecessary and Ignored for this route
 * - This route returns a generic payload of:
 * ```{
 *    "name": "sample handler"
 * ```}
 */
function sample(data, callback) {
  // Callback a http status code and a payload object
  callback(406, { name: "sample handler" });
}

module.exports = sample;
