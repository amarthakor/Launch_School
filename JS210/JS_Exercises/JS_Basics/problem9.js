function integerToString(number) {
  let numHolder = [];
  numHolder.push(number);
  return numHolder.join();
}


console.log(integerToString(4321));      // "4321"
console.log(integerToString(0));       // "0"
console.log(integerToString(5000));      // "5000"