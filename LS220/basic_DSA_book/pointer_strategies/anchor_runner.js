// Given an array of positive integers, our task is
// to move all ones to the end of the array while preserving
// the relative order of non-one elements. The goal is to solve
// this problem in linear time complexity.

// If no ones are present in the array, no changes are needed.


/*
Algorithm:
- init anchor and runner to 0
- while runner is less than the array size
	- if the element at runner is not 1
		- swap the elements referenced by anchor and runner respectively
		- increment anchor by 1mj
	- increment runner by 1
- return the array

*/

function moveOnes(numbers) {
  let anchor = 0;
  let runner = 0;

  while (runner < numbers.length) {
    if (numbers[runner] !== 1) {
      [numbers[anchor], numbers[runner]] = [numbers[runner], numbers[anchor]];
      anchor += 1;
    }

    runner += 1;
  }

  return numbers;
}

// Example:
let nums = [1, 2, 1, 4, 8];
console.log(moveOnes(nums));                      // Output: [2, 4, 8, 1, 1]
console.log(moveOnes([2, 2, 1, 3, 1, 8]));        // [2, 2, 3, 8, 1, 1]
console.log(moveOnes([3, 1, 5, 1, 1, 4, 8, 1]));  //[3, 5, 4, 8, 1, 1, 1, 1]