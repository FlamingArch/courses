const myFunc = function () {
  setTimeout(() => {
    console.log("Inside Timeout");
    // }, 1000);
  }, 0);
};

myFunc();

console.log("Outside Element");
