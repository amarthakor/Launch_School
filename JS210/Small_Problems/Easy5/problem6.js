function sequence(number) {
  let numbersArr = [];
  for (let idx = 1; idx <= number; idx += 1) {
    numbersArr.push(idx);
  }

  return numbersArr;
}

console.log(sequence(5));    // [1, 2, 3, 4, 5]
console.log(sequence(3));    // [1, 2, 3]
console.log(sequence(1));    // [1]