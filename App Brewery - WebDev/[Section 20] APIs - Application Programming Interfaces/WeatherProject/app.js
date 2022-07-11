const { response } = require("express");
const express = require("express");
const https = require("https");
const bodyParser = require("body-parser");

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.sendFile(__dirname + "/index.html");
});

app.post("/", (req, res) => {
  const apiKey = "4d816c474f40f8252ef2dd996be3761f";
  const query = req.body.cityName;
  const unit = "metric";
  const url = `https://api.openweathermap.org/data/2.5/weather?q=${query}&appid=${apiKey}&units=${unit}`;
  https.get(url, (response) => {
    response.on("data", (data) => {
      const parsedData = JSON.parse(data);

      const temp = parsedData.main.temp;
      const weatherDescription = parsedData.weather[0].description;
      const icon = parsedData.weather[0].icon;

      res.set("Content-Type", "text/html");

      res.write(`<h1>The Temperature in ${query} is ${temp} <h1>`);
      res.write(`<h3>The Weather Description is ${weatherDescription}</h3>`);
      res.write(
        `<img src="http://openweathermap.org/img/wn/${icon}@2x.png"></img>`
      );
      res.send();
    });
  });

});

app.listen(3000, () => {
  console.log("Server is running at port 3000");
});

