function signedIntegerToString(number) {
  let numHolder = [];
  numHolder.push(number);
  return numHolder.join();
}

console.log(signedIntegerToString(4321));      // "+4321"
console.log(signedIntegerToString(-123));      // "-123"
console.log(signedIntegerToString(0));         // "0"