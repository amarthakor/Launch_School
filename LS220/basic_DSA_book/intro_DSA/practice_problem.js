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


// *** ORIGINAL SOLUTION: O(N^2) TIME COMPLEXITY

// function findMajority(numbers) {
//   let uniqNums = [];
//   numbers.forEach(num => {
//     if (!uniqNums.includes(num)) uniqNums.push(num);
//   });

//   let groupedNums = [];
//   uniqNums.forEach(uniqNum => {
//     let currentGroup = [];
//     numbers.forEach(num => {
//       if (uniqNum === num) currentGroup.push(num);
//     });
//     groupedNums.push(currentGroup);
//   });

//   let largestSubarr = 0;
//   groupedNums.forEach(group => {
//     if (group.length > largestSubarr) largestSubarr = group.length;
//   });

//   let majority = groupedNums.filter(group => group.length === largestSubarr);
//   return majority[0][0];
// }


// Updated solution O(N + K) time complexity, O(N) space complexity
function findMajority(numbers) {
  const uniqNums = {};

  numbers.forEach(num => {
    if (!uniqNums[num]) {
      uniqNums[num] = 1;
    } else {
      uniqNums[num] += 1;
    }
  });

  let maxCountPair = [0, 0];

  for (let number in uniqNums) {
    if (uniqNums[number] > maxCountPair[1]) maxCountPair = [Number(number), uniqNums[number]];
  }

  return maxCountPair[0];
}

// ideal O(N) time complexity solution

// function findMajority(nums) {
//   const counts = new Map();
//   const majorityCount = Math.ceil(nums.length / 2);

//   for (let num of nums) {
//     if (counts.has(num)) {
//       counts.set(num, counts.get(num) + 1);
//     } else {
//       counts.set(num, 1);
//     }

//     if (counts.get(num) >= majorityCount) {
//       return num;
//     }
//   }
// }

console.log(findMajority([6, 4, 4, 6, 4]) === 4);
console.log(findMajority([4, 5, 2, 5, 5, 5, 1]) === 5);
console.log(findMajority([1, 2, 1, 2, 2, 1, 2]) === 2);
console.log(findMajority([1, 2, 3, 1, 4, 4, 1, 1]) === 1);
console.log(findMajority([5, 5, 5]) === 5);

// All test cases should log true
