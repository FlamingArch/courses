const mongoose = require("mongoose");

mongoose.connect("mongodb://localhost:27017/fruitsDB", {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const fruitSchema = new mongoose.Schema({
  name: {
    type: String,
    // required: [true, "Why no Name?"],
  },
  rating: {
    type: Number,
    min: 1,
    max: 10,
  },
  review: String,
});

const Fruit = mongoose.model("Fruit", fruitSchema);

const fruit = new Fruit({
  // name: "Apple",
  rating: 10,
  // review: "Pretty Solid as a fruit",
  review: "Peaches are so yummy",
});

// fruit.save();

const pineapple = new Fruit({
  name: "Pineapple",
  rating: 10,
  review: "Great Fruit",
});
// pineapple.save();

const grape = new Fruit({
  name: "Grape",
  rating: 10,
  review: "Great when sweet",
});
// grape.save();

const personSchema = new mongoose.Schema({
  name: String,
  age: Number,
  favoriteFruit: fruitSchema,
});

const Person = mongoose.model("Person", personSchema);

// const person = new Person({
//   name: "John",
//   age: 37,
// });

const person = new Person({
  name: "Amy",
  age: 12,
  favoriteFruit: pineapple,
});

Person.updateOne({ name: "John" }, { favoriteFruit: grape }, (err) => {
  if (err) console.log("Error :>> ", err);
  else console.log("Successfully updated the document");
});

// person.save();

// const kiwi = new Fruit({
//   name: "Kiwi",
//   rating: 7,
//   review: "The best fruit!",
// });

// const orange = new Fruit({
//   name: "Orange",
//   rating: 7,
//   review: "Too sour for me",
// });

// const banana = new Fruit({
//   name: "Banana",
//   rating: 7,
//   review: "Weird texture",
// });

// Fruit.insertMany([kiwi, orange, banana], (err) => {
//   if (err) {
//     console.log("error :>> ", error);
//   } else {
//     console.log("Successfully saved all the fruits to fruitsDB");
//   }
// });

Fruit.find((err, fruits) => {
  if (err) {
    console.log("error :>> ", error);
  } else {
    mongoose.connection.close();
    fruits.forEach((element) => {
      console.log(`${element.name} `);
    });
  }
});

// Fruit.updateOne(
//   { _id: "60e87f911b7f1a00f4034abd" },
//   { name: "Peach" },
//   (err) => {
//     if (err) console.log("error :>> ", error);
//     else console.log("Success");
//   }
// );

// Fruit.deleteOne({ _id: "60e87f911b7f1a00f4034abd" }, (err) => {
//   if (err) console.log("error :>> ", error);
//   else console.log("Success");
// });

// Person.deleteMany({ name: "John" }, (err) => {
//   if (err) console.log("error :>> ", error);
//   else console.log("Success");
// });
