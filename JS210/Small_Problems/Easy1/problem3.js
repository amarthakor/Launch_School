let rlSync = require("readline-sync");

const METERS_TO_FEET = 10.7639;

let width = Number(rlSync.question('Please enter the width of your room in meters: \n'));
let length = Number(rlSync.question(
  'Please enter the length of your room in meters: \n'
));

let area = width * length;

console.log(`The area of the room is ${area} square meters 
  (${area * METERS_TO_FEET})`);