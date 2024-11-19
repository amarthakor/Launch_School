let rlSync = require('readline-sync');

let currentAge = rlSync.question('What is your age?\n');
let retiredAge = rlSync.question('At what age would you like to retire at?\n');
let retiredDiff = retiredAge - currentAge;

let currentYear = new Date;
currentYear = currentYear.getFullYear();

let retiredYear = currentYear + retiredDiff;

console.log(`It's ${currentYear}. You will retire in ${retiredYear}.`);
console.log(`You only have ${retiredDiff} years of work to go!`);