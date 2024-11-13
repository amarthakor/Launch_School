function firstNOf(arr, count) {
  let newArr = [];

  for (let idx = 0; idx < count; idx += 1) {
    newArr.push(arr[idx]);
  }

  return newArr;
}


let digits = [4, 8, 15, 16, 23, 42];
console.log(firstNOf(digits, 3));    // returns [4, 8, 15]