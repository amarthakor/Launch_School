let rlSync = require('readline-sync');

let num1 = rlSync.question("What's the first number?\n");
// let num1 = Number(rlSync.question("What's the first number?\n"));
let num2 = rlSync.question("What's the second number?\n");
// let num2 = Number(rlSync.question("What's the second number?\n"));

console.log(Number(num1) + Number(num2));
