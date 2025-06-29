/*

Extend the code from the previous problem with a stopCounting function that stops the logger when called.

*/

function startCounting() {
  let counter = 1;

  let counting = setInterval(() => {
    console.log(counter);
    counter++;
  }, 1000);

  return counting;
}


function stopCounting(logger) {
  clearInterval(logger)
}

let logger = startCounting();

setTimeout(() => {
  clearInterval(logger);
}, 5000);