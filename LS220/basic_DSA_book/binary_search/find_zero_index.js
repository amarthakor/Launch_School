// Write a function named `findZeroPosition` that takes in a
// sorted array of distinct integers as input.
// The function should return the index where the value 0 is
// found in the array, or the index where it would be inserted if
// it were not found.

// If the value 0 is found in the array, the function should
// return the index of the value 0. If the value 0 is not found,
// the function should return the index where it would be inserted
// while maintaining the sorted order of the array.

/*
Algorithm:
- set left to 0
- set right to end of array size - 1
- while left is <= right
	- set mid = (left + right) / 2 # floor
		- if array(mid) === target
			- return mid
		- else if array(mid) < target
			- left = mid + 1
		- else
			- right = mid - 1
- return left
*/

function findZeroPosition(nums) {
  let left = 0;
  let right = nums.length - 1;

  while (left <= right) {
    let mid = Math.floor((left + right) / 2);
    if (nums[mid] === 0) {
      return mid;
    } else if (nums[mid] < 0) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return left;
}

// Example:
nums = [-7, -5, -3, 0, 2];
console.log(findZeroPosition(nums)); // Output: 3

// Example:
nums1 = [3, 5, 7, 9, 11];
console.log(findZeroPosition(nums1)); // Output: 0

console.log(findZeroPosition([-8, -7, -5, -2, -1])); // 5