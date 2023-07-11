/*
 * Primary file for API
 *
 */

// Dependencies

const http = require("http");
const https = require("https");
const url = require("url");
const fs = require("fs");
const { StringDecoder } = require("string_decoder");
const config = require("./config");

// Instantiating the HTTP server
// The server should respond to all requests with a string
var httpServer = http.createServer(function (req, res) {
  unifiedServer(req, res);
});

var httpsServerOptions = {
  key: fs.readFileSync("./https/key.pem"),
  certificate: fs.readFileSync("./https/cert.pem"),
};

var httpsServer = https.createServer(httpsServerOptions, function (req, res) {
  unifiedServer(req, res);
});

// Start the http server
httpServer.listen(config.port, function () {
  console.log(
    `The server is listening on port ${config.httpPort} in ${config.envName} now`
  );
});

// Start the https server
httpsServer.listen(config.port, function () {
  console.log(
    `The server is listening on port ${config.httpsPort} in ${config.envName} now`
  );
});

// All the server logic for both the http server and https server
const unifiedServer = function (req, res) {
  // Get the URL and parse it
  var parsedUrl = url.parse(req.url, true); // Setting it true allows it to call querystring module

  // Get the path from the url
  var path = parsedUrl.pathname;
  var trimmedPath = path.replace(/^\/+|\/+$/g, ""); // Regex to trim starting and ending slashes

  // Get the query string as an object
  var queryStringObject = parsedUrl.query;

  // Get the HTTP Method
  var method = req.method.toLowerCase();

  // Get the headers as an object
  var headers = req.headers;

  // Get the payload, if there is any
  var decoder = new StringDecoder("utf-8");
  var buffer = "";
  req.on("data", (data) => {
    buffer += decoder.write(data);
  });
  // On request end, end the decoder. End will always be called, so if there is no payload, buffer will remain as an empty string.
  req.on("end", () => {
    buffer += decoder.end();

    // Chose the handler this request should go to. If one is not found, use the not found handler
    var chosenHandler =
      typeof router[trimmedPath] !== "undefined"
        ? router[trimmedPath]
        : handlers.notFound;

    // Construct the data object to send to the handler
    var data = {
      trimmedPath,
      queryStringObject,
      method,
      headers,
      payload: buffer,
    };

    // Route the request to the handler specified in the router
    chosenHandler(data, function (statusCode, payload) {
      // Use the status code called back by the handler, or default to 200
      statusCode = typeof statusCode == "number" ? statusCode : 200;

      // Use the payload defined by the handler, or default to 200
      payload = typeof [payload] == "object" ? payload : {};

      // Convert the payload to a string
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

// Define the handlers
var handlers = {};

// Sample handler
handlers.sample = function (data, callback) {
  // Callback a http status code and a payload object
  callback(406, { name: "sample handler" });
};

handlers.ping = function (data, callback) {
  callback(200);
};

// Not found handler
handlers.notFound = function (data, callback) {
  callback(404);
};

// Define a request router
var router = {
  sample: handlers.sample,
  ping: handlers.ping,
};
