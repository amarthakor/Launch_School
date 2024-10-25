// Write a program that uses a multiply function to multiply two numbers 
// and returns the result. Ask the user to enter the two numbers, then 
// output the numbers and result as a simple equation.

let rlSync = require('readline-sync');
function getNumber(msg) {
  let number = Number(rlSync.question(msg));
  return number
}

let num1 = getNumber("Enter a number\n");
let num2 = getNumber("Enter another number\n");
console.log(`${num1} * ${num2} = ${num1 * num2}`);