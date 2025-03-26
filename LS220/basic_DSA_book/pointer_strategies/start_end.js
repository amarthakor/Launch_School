// Given a sorted array in ascending order, our task is to find two numbers
// in the array that sum up to a target number, and return them.

// If you don't find a pair that adds up to the target, return null.

// The order of the output array matters, and the number that appears first
// should be the first one in the output array.

// The problem guarantees that there will be either one
// unique pair that matches the target sum or no pairs at all.

// Algorithm
/*
- Initialize `s` to 0 and `e` to the last index of the array
- Loop through the array
	- Sum the elements at indices `s` and `e` respectively:
		- If the sum === target number
			- Return [arr[s], arr[e]]
		- If the sum is LESS THAN the target number
			- increment `s` += 1
		- If the sum is GREATER THAN the target number
			- decrement `e` by -= 1
		- IF `s` === `e`,
			- break out of the loop
- Return null
*/

function findPair(numbers, target) {
  let s = 0;                  // change to `start` for clarity
  let e = numbers.length - 1; // change to `end` for clarity

  while (s < e) {
    if (numbers[s] + numbers[e] === target) return [numbers[s], numbers[e]];
    if (numbers[s] + numbers[e] < target) s += 1;
    if (numbers[s] + numbers[e] > target) e -= 1;
  }

  return null;
}

// Test Cases:

const nums1 = [1, 3, 6, 7, 8, 12];
const target1 = 14;
console.log(findPair(nums1, target1)); // Output: [6, 8]

const nums2 = [2, 6, 8, 10];
const target2 = 17;
console.log(findPair(nums2, target2)); // null