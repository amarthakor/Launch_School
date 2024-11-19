let rlSync = require('readline-sync');

let numbers = [];
let first = rlSync.question('Enter the 1st number:\n');
numbers.push(first);

let second = rlSync.question('Enter the 2nd number:\n');
numbers.push(second);

let third = rlSync.question('Enter the 3rd number:\n');
numbers.push(third);

let fourth = rlSync.question('Enter the 4th number:\n');
numbers.push(fourth);

let fifth = rlSync.question('Enter the 5th number:\n');
numbers.push(fifth);

let sixth = rlSync.question('Enter the last number:\n');

if (numbers.includes(sixth)) {
  console.log(`The number ${sixth} appears in [${numbers.join(', ')}].`);
} else {
  console.log(`The number ${sixth} does not appear in ${numbers}.`);
}
