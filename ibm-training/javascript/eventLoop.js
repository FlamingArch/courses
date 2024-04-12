function func1(x) {
  return 2 * x;
}

function func2(y, callback) {
  // return func1(y + 5) - 10;
  setTimeout(() => {
    callback(y + func1(12));
  }, 1000);
}

func2(15, (data) => console.log(data));
console.log("sup");
