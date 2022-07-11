const express = require("express");
const bodyParser = require("body-parser");
const date = require(__dirname + "/date.js");

const app = express();
app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

const itemsList = ["Buy Food", "Cook Food", "Eat Food"];
const workItems = [];

app.post("/", (req, res) => {
  if (req.body.list == "Work") {
    workItems.push(req.body.newItem);
    res.redirect("/work");
  } else {
    itemsList.push(req.body.newItem);
    // console.log("itemsList :>> ", itemsList);
    res.redirect("/");
  }
});

app.get("/", (req, res) => {
  res.render("list", { listTitle: date.getDate(), newListItem: itemsList });
});

app.get("/work", (req, res) => {
  res.render("list", { listTitle: "Work", newListItem: workItems });
});

app.get("/about", (req, res) => {
  res.render("about");
});

let port = 3000;
app.listen(port, () => {
  console.log(`Server started on Port ${port}`);
});
