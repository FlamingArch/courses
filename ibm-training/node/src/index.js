import fs from "fs";

const readFile = (fileName, callback) => {
  fs.readFile(fileName, (err, data) => {
    if (err) return callback(err);
    const lines = data.toString().trim().split("\n");
    callback(null, lines);
  });
};

readFile("data", (err, data) => {
  err ? console.error(err) : console.log(data);
});

readFile("data", (err, data) => {
  if (err) console.error(err);
  else {
    data.forEach((e) => {
      const n = parseInt(e);
      if (n % 2 == 0) console.log(n);
    });
  }
});

readFile("data", (err, data) => {
  err
    ? console.error(err)
    : console.log(data.map(Number).filter((n) => n % 2 == 0));
});
