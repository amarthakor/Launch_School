function lastNOf(arr, count) {
  let newArr = [];
  let startIdx = arr.length - count;

  for (startIdx; startIdx < arr.length; startIdx += 1) {
    newArr.push(arr[startIdx]);
  }
  return newArr;
}

let digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, 3));    // returns [16, 23, 42]