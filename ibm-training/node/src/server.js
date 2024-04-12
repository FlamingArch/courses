import http from "http";
import fs from "fs";
import EventEmitter from "events";

const server = http.createServer();

server.on("request", (req, res) => {
  switch (req.url) {
    case "/home":
      res.writeHead(200, {
        "content-type": "text/plain",
      });
      res.write("Message from Server");
      res.end();
      break;
    case "/api":
      res.writeHead(200, {
        "content-type": "application/json",
      });
      res.end(
        JSON.stringify({
          name: "Bond",
          james: "Bond",
        })
      );
      break;
    case "/about":
    case "/news":
      res.writeHead(200, { "content-type": "text/html" });
      res.end(fs.readFileSync(`public/${req.url}.html`));
      break;
    case "/":
      res.writeHead(301, { Location: "/home" });
      res.end();
      break;
    default:
      res.writeHead(404);
      res.end();
      break;
  }
});

console.log(server instanceof EventEmitter);

server.listen(6969, () =>
  console.log("Server Started on Port 6969: https://localhost:6969")
);
