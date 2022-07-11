// Long Running Operations Block Execution
//   Most applications are single threaded
//     - One Worker Process
//     - One Activity at a time
//   User Interface or application could appear frozen and No other tasks can execute
// Certain operations like File I/O, REST calls, Database operations, complex computations
//   can take a long time

// Earlier, we waited an amount of time for a function to finish
// Originally Managed via Callbacks

function callback() {
  console.log("Timeout Completed");
}

setTimeout(callback, 3000);
// Waits 3 seconds and then performs callback() when timeout completes

// Cascading becomes an issue:
//   If a function calls another function and it calls another function and so on,
//     times may add up and time to finish may become unpredictable.
//   longRunningOperation(() => {
//     anotherLongRunningOperation(() => {
//       yetAnother(() => {
//         oneMore(() => {
//           lastOne(() => {
//             console.log("Where are we? :>> ");
//           });
//         });
//       });
//     });
//   });
//

// Enter Promises
//   A promise is a where code, after completion will let me know it has finished.
//   A common development pattern and cleaner version of callbacks.
//   Most modern versions of JavaScript will contain promise objects built-in
function promiseTimeout(ms) {
  // Promise object, accepts a function with parameters `resolve` and `rejects`
  // Call `resolve` when operation succeeds
  // Call `reject` when operation fails
  return new Promise((resolve, reject) => {
    setTimeout(resolve, ms); // Calls resolve when timeout finishes
  });
}

promiseTimeout()
  .then(() => {
    console.log("Done");
    return Promise.resolve(42);
  })
  .then((response) => {
    console.log("response :>> ", response);
  })
  .catch(() => {
    console.log("cool error handling");
  });
