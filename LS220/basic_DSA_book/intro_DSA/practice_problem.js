// Given an array of numbers, return its majority element.

// The majority element is the value in the array that appears
// as at least half of the elements in the array.

// It is guaranteed that only one majority element exists in the array.

// Test Cases:

/*
- find uniq elements
- create an array of subarrs where each subarr is a specific element
  - this will be double nested loop 
  - uniq element outer loop
    - then inner loop will be given array
- find the max length of all the subarrs
- iterate thru the subarrs and select the first element from the subarr that matches
  - the max count
*/

function findMajority(numbers) {
  let uniqNums = [];
  numbers.forEach(num => {
    if (!uniqNums.includes(num)) uniqNums.push(num);
  });

  let groupedNums = [];
  uniqNums.forEach(uniqNum => {
    let currentGroup = [];
    numbers.forEach(num => {
      if (uniqNum === num) currentGroup.push(num);
    });
    groupedNums.push(currentGroup);
  });

  let largestSubarr = 0;
  groupedNums.forEach(group => {
    if (group.length > largestSubarr) largestSubarr = group.length;
  });

  let majority = groupedNums.filter(group => group.length === largestSubarr);
  return majority[0][0];
}

console.log(findMajority([6, 4, 4, 6, 4]) === 4);
console.log(findMajority([4, 5, 2, 5, 5, 5, 1]) === 5);
console.log(findMajority([1, 2, 1, 2, 2, 1, 2]) === 2);
console.log(findMajority([1, 2, 3, 1, 4, 4, 1, 1]) === 1);
console.log(findMajority([5, 5, 5]) === 5);

// All test cases should log true