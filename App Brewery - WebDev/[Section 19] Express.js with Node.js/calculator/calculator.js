const express = require("express");
const bodyParser = require("body-parser");

const app = express();
// URLEncoded is the type of data returned by forms
// [extended: true] allows posting nested objects
//      body-parser requires you to explicitly declare
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.sendFile(__dirname + "/index.html");
});

app.post("/", (req, res) => {
  var num1 = Number(req.body.num1)
  var num2 = Number(req.body.num2)

  res.send(`Result of Calculation is ${num1+num2}`);
});

app.listen(3000, () => {
  console.log("Started Server on Port 3000");
});
