const express = require("express");

const app = express();

app.get("/news/:topic", function (req, res) {
  console.log(req.params.topic);
});

app.listen("3000", function () {
  console.log("Server is running at port 3000");
});
