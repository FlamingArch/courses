const _data = require("../lib/data");

_data.create("test", "newFile", { foo: "bar" }, (err) => {
  console.log("This was the error: ", err);

  _data.read("test", "newFile", (err, data) => {
    console.log("Error: ", err, "and Data: ", data);

    _data.update("test", "newFile", { fizz: "buzz" }, (err) => {
      console.log("This was the error: ", err);

      _data.read("test", "newFile", (err, data) => {
        console.log("Error: ", err, "\nData: ", data);

        _data.delete("test", "newFile", (err) => {
          console.log("Error: ", err);
        });
      });
    });
  });
});
