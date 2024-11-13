function doubleReverse(arr) {
  let newArr = [];

  for (let idx = 0; idx < arr.length; idx += 1) {
    newArr.push(arr[idx]);
  }

  for (let idx = arr.length - 1; idx >= 0; idx -= 1) {
    newArr.push(arr[idx]);
  }

  return newArr;
}

let digits = [4, 8, 15, 16, 23, 42];

console.log(doubleReverse(digits));    // returns [8, 16, 42]