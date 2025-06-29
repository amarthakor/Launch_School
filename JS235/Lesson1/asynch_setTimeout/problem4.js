/*


Write a function named afterNSeconds that takes two arguments: a callback and a time duration in seconds. The function should wait for the indicated period and then invoke the callback function.



*/

function afterNSeconds(cb, time) {
  setTimeout(cb, time * 1000);
}

function logHi() {
  console.log('hi');
}

afterNSeconds(logHi, 5); // log 'hi' after 5 seconds