/*

Convert this processData function to a new function named processDataPromise that uses promises. This function should return a promise that processes an array of numbers after a delay, utilizing the .then() method for logging the altered array.

function processData(numbers, callback) {
  setTimeout(() => {
    const processed = numbers.map(callback);
    console.log(processed);
  }, 1000);
}

// Example usage:
processData([1, 2, 3], (number) => number * 2);
// After 1 second, logs: [2, 4, 6]


*/



function processDataPromise(numbers, callback) {
  return new Promise((resolve) => {
    setTimeout(() => {
      let transformedNums = numbers.map(callback);
      resolve(transformedNums);
    }, 1000);
  });
}



// Here's how we'll use our new promise-based version:

// Example usage:
processDataPromise([1, 2, 3], (number) => number * 2).then((processedNumbers) => {
  console.log(processedNumbers);
  // After 1 second, logs: [2, 4, 6]
});