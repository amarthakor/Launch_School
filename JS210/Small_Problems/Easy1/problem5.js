rlSync = require('readline-sync');

function sumOrProduct(number, comp) {
  let counter = (comp === 's') ? 0 : 1;
  let currentValue = (comp === 's') ? 0 : 1;

  if (comp === 's') {
    for (currentValue; counter <= number; counter += 1) {
      currentValue += counter;
    }
    return `The sum of integers between 1 and ${number} is ${currentValue}`;
  } else {
    for (currentValue; counter <= number; counter += 1) {
      currentValue *= counter;
    }
    return `The product of integers between 1 and ${number} is ${currentValue}`;
  }
}

let num = parseInt(rlSync.question('Please enter an integer greater than 0:\n'));
let computation = rlSync.question('Enter "s" to compute the sum, or "p" to compute the product.\n');

console.log(sumOrProduct(num, computation));
