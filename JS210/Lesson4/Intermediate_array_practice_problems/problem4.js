function matrixSums(arr) {
  let allSums = [];

  for (let idx = 0; idx < arr.length; idx += 1) {
    let sum = 0;
    for (let innerIdx = 0; innerIdx < arr[idx].length; innerIdx += 1) {
      sum += arr[idx][innerIdx];
    }
    allSums.push(sum);
  }

  return allSums;
}

console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]]));  // returns [15, 60, 12]