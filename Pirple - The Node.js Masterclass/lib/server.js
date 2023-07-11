const url = require("url");
const handlers = require("./handlers");
const helpers = require("./helpers");
const router = require("./router");

const unifiedServer = function (req, res) {
  var parsedUrl = url.parse(req.url, true); // Setting it true allows it to call querystring module
  var path = parsedUrl.pathname;
  var trimmedPath = path.replace(/^\/+|\/+$/g, ""); // Regex to trim starting and ending slashes
  var queryStringObject = parsedUrl.query;
  var method = req.method.toLowerCase();
  var headers = req.headers;

  // Get the payload, if there is any
  var decoder = new StringDecoder("utf-8");
  var buffer = "";
  req.on("data", (data) => {
    buffer += decoder.write(data);
  });

  // On request end, end the decoder.
  // End will always be called, so if there is no payload,
  // buffer will remain as an empty string.
  req.on("end", () => {
    buffer += decoder.end();

    // Chose the handler this request should go to.
    //If one is not found, use the not found handler
    var chosenHandler =
      typeof router[trimmedPath] !== "undefined"
        ? router[trimmedPath]
        : handlers.notFound;

    var data = {
      trimmedPath,
      queryStringObject,
      method,
      headers,
      payload: helpers.parseJSONToObject(buffer),
    };

    chosenHandler(data, function (statusCode, payload) {
      // Use the status code called back by the handler, or default to 200
      statusCode = typeof statusCode == "number" ? statusCode : 200;

      // Use the payload defined by the handler, or default to 200
      payload = typeof [payload] == "object" ? payload : {};
      var payloadString = JSON.stringify(payload);

      // Return the response
      res.setHeader("Content-Type", "application/json");
      res.writeHead(statusCode);
      res.end(payloadString);
      console.log("Responding with this status code: ", statusCode);
      console.log("Responding with this payload: ", payloadString);
    });

    // Send the response
    // res.end("Hello, World!\n");

    // Log the request path
    console.log("Request received with this payload: ", buffer);
  });

  // Send the response
  // res.end("Hello, World!\n");

  // Log the request path
  console.log(
    `Request received on path: ${trimmedPath} with method: ${method} and with these query string parameters ${JSON.stringify(
      queryStringObject
    )} and these headers: ${JSON.stringify(headers)}`
  );
};

module.exports = unifiedServer;
