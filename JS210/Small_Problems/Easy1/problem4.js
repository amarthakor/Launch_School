let rlSync = require("readline-sync");

let bill = parseFloat(rlSync.question("What is the bill?\n"));
let percent = parseInt(rlSync.question("What is the tip percentage?\n"));

let tip = bill * percent / 100;
console.log(`The tip is $${tip.toFixed(2)}`);
console.log(`The total is $${(tip + bill).toFixed(2)}`);