// given a sorted array of nums from ascending order
// find the range of indices from the start 3 to the end 3
// if there are no 3's, return [-1, 1]
function rangeOfThree(numbers) {
  if (!numbers.includes(3)) return [-1, 1];
  let startIdx = numbers.indexOf(3);
  let endIdx = numbers.indexOf(3);

  numbers.forEach((num, idx) => {
    if (num === 3 && endIdx < idx) endIdx = idx;
  });

  return [startIdx, endIdx];
}

console.log(rangeOfThree([1, 2, 3, 3, 3, 3, 3, 4, 5])); // [2, 6]
console.log(rangeOfThree([1, 2, 5, 5, 6, 9, 10]));      // [-1, 1]
console.log(rangeOfThree([1, 2, 3, 4, 5]));             // [2, 2]