// Promises, while being cleaner, are not perfect and can add bloat to the code.

// async/await
// Standard in many languages
// Syntax closer to synchronous code

function promiseTimeout(ms) {
  // Anything returning a Promise works
  return new Promise((resolve, reject) => {
    setTimeout(resolve, ms);
  });
}
// `async`: Indicates function will have an `await`
async function simulateLongOperation() {
  // pauses while operation completes
  await promiseTimeout(1000);
  return 42; // Same as Promise.resolve(42)
}

async function run() {
  const answer = await simulateLongOperation(); // Retrieves successful value
  console.log("answer :>> ", answer);   // Can also use try/catch
}

run();
