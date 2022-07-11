const express = require("express");
const bodyParser = require("body-parser");
const ejs = require("ejs");
const mongoose = require("mongoose");

mongoose.connect("mongodb://localhost:27017/wikiDB", {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const articleSchema = new mongoose.Schema({
  title: String,
  content: String,
});

const Article = mongoose.model("Article", articleSchema);

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));
app.set("view engine", "ejs");

app.get("/", (req, res) => {
  res.send("Hello World");
});

///////////////////////////////// Requests targeting all articles /////////////////////////////////
app
  .route("/articles")
  .get((req, res) => {
    Article.find((err, foundArticles) => {
      if (!err) {
        res.send(foundArticles);
      } else {
        res.send(err);
      }
    });
  })
  .post((req, res) => {
    const newArticle = new Article({
      title: req.body.title,
      content: req.body.content,
    });
    newArticle.save((err) => {
      if (!err) {
        res.send("Successfully added a new article.");
      } else {
        res.send(err);
      }
    });
  })
  .delete((req, res) => {
    Article.deleteMany((err) => {
      if (!err) {
        res.send("Successfully Deleted all articles");
      } else {
        res.send(err);
      }
    });
  });

///////////////////////////////// Requests targeting a specific article /////////////////////////////////

app
  .route("/articles/:articleName")
  .get((req, res) => {
    Article.findOne({ title: req.params.articleName }, (err, foundArticles) => {
      if (foundArticles) {
        res.send(foundArticles);
      } else {
        res.send("No articles matching that title was found");
      }
    });
  })
  .put((req, res) => {
    Article.updateOne(
      { title: req.params.articleName },
      { title: req.body.title, content: req.body.content },
      { overwrite: true },
      (err) => {
        if (!err) {
          res.send("Successfully Updated Article");
        } else {
          res.send(err);
        }
      }
    );
  })
  .patch((req, res) => {
    Article.updateOne(
      { title: req.params.articleName },
      { $set: req.body },
      (err) => {
        if (!err) {
          res.send("Successfully Updated Article");
        } else {
          res.send(err);
        }
      }
    );
  })
  .delete((req, res) => {
    Article.deleteOne({ title: req.params.articleName }, (err) => {
      if (!err) {
        res.send("Successfully Deleted the corresponding article");
      } else {
        res.send(err);
      }
    });
  });

app.listen(3000, () => {
  console.log("Server started on port 3000");
});

/*
{
    "_id" : ObjectId("611e2177e0983331b7f0d058"),
    "title" : "REST",
    "content" : "REST is short for REpresentational State Transfer. It's an architectural style for designing APIs"
}
{
    "_id" : ObjectId("5c139771d79ac8eac11e754a"),
    "title" : "API",
    "content" : "API stands for Application Programming Interface. It is a set of subroutine definitions, communication protocols, and tools for building software. In general terms, it is a set of clearly defined methods of communication among various components. A good API makes it easier to develop a computer program by providing all the building blocks, which are then put together by the programmer."
}
{
    "_id" : ObjectId("5c1398aad79ac8eac11e7561"),
    "title" : "Bootstrap",
    "content" : "This is a framework developed by Twitter that contains pre-made front-end templates for web design"
}
{
    "_id" : ObjectId("5c1398ecd79ac8eac11e7567"),
    "title" : "DOM",
    "content" : "The Document Object Model is like an API for interacting with our HTML"
}
{
    "_id" : ObjectId("611e669f5067ed401d623361"),
    "title" : "Harsh Chaturvedi",
    "content" : "Harsh once stepped on quicksand. The quicksand couldn't survive and quickly drowned.",
    "__v" : 0
}
*/
