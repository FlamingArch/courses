# MongoDB

Express.js is required for Server Side Rendering

## Insertion
```
db.products.insertOne({
  "productName": "Oppo13",
  "price": 43545.5,
  "starRating": 4,
  "productId": 5,
  "productCode": "Oppo13",
  "productAvailable": "12-Jan-2022",
  "imageUrl": "https://m.media-amazon.com/images/I/31VjlrbE3bL._SY445_SX342_QL70_FMwebp_.jpg"
}, {"writeConcern": {"w": 2, "j":true, "wtimeout":5000}})
```
w:
j: Whether the operation is written on disk or memory
wtimeout: Wait time before the request is timed out.

## MongoDB Commands
```
db.products
	.insertOne()
	.insertMany()
    .updateOne()
    .updateMany({"title": {$eq: "Database Conference"}}, {$set: {"atten}})
	.deleteOne()
	.deleteMany()
	.countDocuments()
	.find({}).sort({“price”: -1})
    .find({"price": {$gt: 50000.0}})  // Products with price greater than 50000.0
    .find({"price": {$gt: 50000.0}})  // Products with price greater than or equal to 50000.0
```
## MongoDB Operators
| Operator | Operation              |
| -------- | ---------------------- |
| $eq      | Equals                 |
| $neq     | Not Equals             |
| $gt      | Greater Than           |
| $gte     | Greater Than or Equals |
| $lt      | Less Than              |
| $lte     | Less Than or Equals    |
