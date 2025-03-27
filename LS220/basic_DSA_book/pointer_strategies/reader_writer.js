// Given an array of positive integers, our task is
// to move all ones to the end of the array while preserving
// the relative order of non-one elements. The goal is to solve
// this problem in linear time complexity.

// If no ones are present in the array, no changes are needed.

/*
Algorithm
- INIT writer (anchor) to 0, reader (runner) to 0
- WHILE my reader is less than the array size
	- IF the element at the reader is !== 1
		- Reassign the element at writer to the element at reader
		- Increment writer by 1
	- Increment reader by 1
- WHILE my writer is less than array size
	- Reassign each element to 1
	- Increment writer by 1
- RETURN my array

*/

function moveOnes(arr) {
  let writer = 0;
  let reader = 0;

  while (reader < arr.length) {
    if (arr[reader] !== 1) {
      arr[writer] = arr[reader];
      writer += 1;
    }

    reader += 1;
  }

  while (writer < arr.length) {
    arr[writer] = 1;
    writer += 1;
  }

  return arr;
}

// Example:
nums = [1, 2, 1, 4, 8];
console.log(moveOnes(nums)); // Output: [2, 4, 8, 1, 1]