const express = require("express");
const request = require("request");
const bodyParser = require("body-parser");
const mailchimp_marketing = require("@mailchimp/mailchimp_marketing");

const apikey = "19a4b879db898ea8ae3b8c622724f983-us6";
const audienceID = "f3a6da17a8";
mailchimp_marketing.setConfig({ apiKey: apikey, server: "us6" });

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

app.get("/", (req, res) => {
  res.sendFile(__dirname + "/signup.html");
});

app.post("/failure", (req, res) => {
  res.redirect("/");
});

app.post("/", (req, res) => {
  const firstName = req.body.firstName;
  const lastName = req.body.lastName;
  const email = req.body.email;
  const subscribingUser = {
    firstName: firstName,
    lastName: lastName,
    email: email,
  };

  const run = async () => {
    const response = await mailchimp_marketing.lists.addListMember(audienceID, {
      email_address: subscribingUser.email,
      status: "subscribed",
      merge_fields: {
        FNAME: subscribingUser.firstName,
        LNAME: subscribingUser.lastName,
      },
    });
    console.log(response); // (optional)

    res.sendFile(__dirname + `/success.html`);
  };
  run().catch((rej) => res.sendFile(__dirname + `/failure.html`));
});

port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Server is running on port ${port}`));
