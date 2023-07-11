/*
 * Primary file for API
 *
 */

// Dependencies
const http = require("http");
const https = require("https");
const fs = require("fs");
const { StringDecoder } = require("string_decoder");
const unifiedServer = require("./lib/server");
const config = require("./lib/config");

const httpServer = http.createServer(unifiedServer);

httpServer.listen(config.port, function () {
  console.log(
    `The server is listening on port ${config.httpPort} in ${config.envName} now`
  );
});

const httpsServerOptions = {
  key: fs.readFileSync("./https/key.pem"),
  certificate: fs.readFileSync("./https/cert.pem"),
};

var httpsServer = https.createServer(httpsServerOptions, unifiedServer);

httpsServer.listen(config.port, () =>
  console.log(
    `The secure server is listening on port ${config.httpsPort} in ${config.envName} now`
  )
);
