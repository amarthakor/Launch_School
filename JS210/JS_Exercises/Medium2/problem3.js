let startingBalance = 1;
const chicken = 5;
const chickenQuantity = 7;

function totalPayable(item, quantity) {
  return startingBalance + (item * quantity);
}

startingBalance = 5;
console.log(totalPayable(chicken, chickenQuantity));
  // logs 40 to console;

startingBalance = 10;
console.log(totalPayable(chicken, chickenQuantity));
  // logs 45 to console; bc we ar reassigning startingBalance bothtimes

