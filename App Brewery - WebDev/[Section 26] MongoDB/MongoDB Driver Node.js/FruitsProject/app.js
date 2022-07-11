const MongoClient = require("mongodb").MongoClient;
const assert = require("assert");

// Connection URL
const url = "mongodb://localhost:27017";

// Database Name
const dbName = "fruitsDB";

// Create a new MongoDB Client
const client = new MongoClient(url, { useUnifiedTopology: true });

client.connect(function (err) {
  assert.strictEqual(null, err);
  console.log("Connected Successfully to server");

  const db = client.db(dbName);

  insertDocuments(db, function () {
    findDocuemnts(db, function () {
      client.close();
    });
  });
  //   findDocuemnts(db, function () {
  //     client.close();
  //   });
});

const insertDocuments = function (db, callback) {
  // Get the Documents collection
  const collection = db.collection("fruits");
  collection.insertMany(
    [
      { name: "Apple", score: 8, review: "Great Fruit" },
      { name: "Orange", score: 6, review: "Kinda Sour" },
      { name: "Banana", score: 9, review: "Great Stuff" },
    ],
    function (err, result) {
      assert.strictEqual(err, null);
      assert.strictEqual(3, result.result.n);
      assert.strictEqual(3, result.ops.length);
      console.log("Inserted 3 documents into collection");
      callback(result);
    }
  );
};

const findDocuemnts = function (db, callback) {
  // Get the documents collection
  const collection = db.collection("fruits");
  collection.find({}).toArray(function (err, fruits) {
    assert.strictEqual(err, null);
    console.log("Found the following records");
    console.log(fruits);
    callback(fruits);
  });
};

/* MONGO ResultL
PS C:\Users\harsh> mongo
MongoDB shell version v4.4.6
connecting to: mongodb://127.0.0.1:27017/?compressors=disabled&gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("10bd9fc0-cff3-42da-a6b8-bc821787ab87") }
MongoDB server version: 4.4.6
---
The server generated these startup warnings when booting:
        2021-07-07T00:41:54.418+05:30: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
---
---
        Enable MongoDB's free cloud-based monitoring service, which will then receive and display
        metrics about your deployment (disk utilization, CPU, operation statistics, etc).

        The monitoring data will be available on a MongoDB website with a unique URL accessible to you
        and anyone you share the URL with. MongoDB may use this information to make product
        improvements and to suggest MongoDB products and deployment options to you.

        To enable free monitoring, run the following command: db.enableFreeMonitoring()
        To permanently disable this reminder, run the following command: db.disableFreeMonitoring()
---
> show dbs
admin     0.000GB
config    0.000GB
fruitsDB  0.000GB
local     0.000GB
shopDB    0.000GB
> use fruitsDB
switched to db fruitsDB
> show collections
fruits
> db.fruits.find()
{ "_id" : ObjectId("60e4bf5a99089f0429219d48"), "name" : "Apple", "score" : 8, "review" : "Great Fruit" }
{ "_id" : ObjectId("60e4bf5a99089f0429219d49"), "name" : "Orange", "score" : 6, "review" : "Kinda Sour" }
{ "_id" : ObjectId("60e4bf5a99089f0429219d4a"), "name" : "Banana", "score" : 9, "review" : "Great Stuff" }
{ "_id" : ObjectId("60e4bf6ef7df9e0434dc8ea0"), "name" : "Apple", "score" : 8, "review" : "Great Fruit" }
{ "_id" : ObjectId("60e4bf6ef7df9e0434dc8ea1"), "name" : "Orange", "score" : 6, "review" : "Kinda Sour" }
>
*/
