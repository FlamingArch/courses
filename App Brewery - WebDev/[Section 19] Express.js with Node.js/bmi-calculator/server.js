const express = require("express");
const bodyParser = require("body-parser");

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req, res) => res.sendFile(__dirname + "/bmiCalculator.html"));
app.post("/", (req, res) => {
  var height = Number(req.body.height);
  var weight = Number(req.body.weight);
  res.send(`
  <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--#region Materialize CSS-->
    <!-- Compiled and minified CSS -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"
    />

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <!-- Material Icons -->
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <!-- #endregion -->
    <!-- #region Styling-->
    <style>
      /* label focus color */
      .input-field input[type="text"]:focus + label {
        color: #3f51b5 !important;
      }
      /* label underline focus color */
      .input-field input[type="text"]:focus {
        border-bottom: 1px solid #3f51b5 !important;
        box-shadow: 0 1px 0 0 #3f51b5 !important;
      }
      /* icon prefix focus color */
      .input-field .prefix.active {
        color: #3f51b5 !important;
      }
    </style>
    <!-- #endregion -->
    <title>BMI Calculator</title>
  </head>
  <body>
    <nav>
      <div class="nav-wrapper indigo">
        <a href="#" class="brand-logo left white-text">BMI Calculator</a>
      </div>
    </nav>
    <h6>Your BMI is ${weight/(height*height)}</h6>
  </body>
</html>

  `);
});

app.listen(3000, () => console.log("Listening on Port 3000"));
