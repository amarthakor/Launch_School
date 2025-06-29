/*

Write a program that does the following:

Logs "Starting..." immediately.
Every 2 seconds, logs "Hello!".
After 10 seconds, stops logging "Hello!" and logs "Goodbye!".


*/

console.log("Starting...");

let greeter = setInterval(() => { console.log('Hello!') }, 2000);

setTimeout(() => { clearInterval(greeter) }, 10000);

setTimeout(() => { console.log('Goodbye!') }, 10001);