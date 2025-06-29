/*

Write a function named startCounting that logs a number to the console every second, starting with 1. Each number should be one greater than the previous number.

*/

function startCounting() {
  let counter = 1;

  setInterval(() => {
    console.log(counter);
    counter++;
  }, 1000);

}

startCounting();