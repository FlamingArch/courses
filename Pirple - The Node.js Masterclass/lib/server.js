const url = require("url");
const { StringDecoder } = require("string_decoder");
const handlers = require("./handlers");
const helpers = require("./helpers");
const router = require("./router");

const unifiedServer = function (req, res) {
  // Parse URL on request
  // Setting it true allows it to call querystring module
  var parsedUrl = url.parse(req.url, true);

  var path = parsedUrl.pathname;
  var trimmedPath = path.replace(/^\/+|\/+$/g, ""); // Regex: trim start and end slashes
  var queryStringObject = parsedUrl.query;
  var method = req.method.toLowerCase();
  var headers = req.headers;

  // Get the payload, if any
  var decoder = new StringDecoder("utf-8");
  var buffer = "";
  req.on("data", (data) => {
    buffer += decoder.write(data);
  });

  // On request end, end the decoder.
  // End will always be called, so if no payload,
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
      statusCode = typeof statusCode == "number" ? statusCode : 200;
      payload = typeof [payload] == "object" ? payload : {};

      var payloadString = JSON.stringify(payload);

      res.setHeader("Content-Type", "application/json");
      res.writeHead(statusCode);
      res.end(payloadString);

      console.log(`:: Responded with:
   - status code: ${statusCode}
   - payload: ${payloadString}\n`);
    });

    // Send the response
    // res.end("Hello, World!\n");

    console.log(`:: Request received with this payload: ${buffer}\n`);
  });

  console.log(
    `:: Request received on
   - path: ${trimmedPath}
   - method: ${method}
   - query string parameters: ${JSON.stringify(queryStringObject)}
   - headers: ${JSON.stringify(headers, {}, 2)}\n`
  );
};

module.exports = unifiedServer;
