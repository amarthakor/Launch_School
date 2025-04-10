/*
Given an array of integers nums, find sum of all of its elements using recursion.

--- Problem
INPUT: an array
OUTPUT: an integer

  Rules:
  - Given an array of integers
  - Return an integer where
    - return integer is the sum of all elements in given arrat of ints
    - find sum using recursion

  - base case is we return 0 if array length is 0
  - recursive defintion:
    - A sum integer is the sum of all integers in an array if the 
      array length is greater than 0 and the array contains all integer elements

Assumptions:
- Will given array always contain only integer data types?
  - Yes
- How should we handle non array rgs?
  - Return null
- Will we ever have additionala rgs and how should we handle them?
  - Only given one arg to function

--- Examples
- Given [1, 2, 3] -> return 6
  - 1 + 2 + 3 = 6
  - 

--- DS
- Given an array
- Need to find sum of all elements
- Ned to use recursion
- Maintain array DS to find sum

--- Algorithm
1. If array length is 0, return 0
2. Set total to last ele in array
3. Increment total by the last ele in the array recursively
  - total + sums(num) here nums should be shortened by 1 element from the end

*/

function sum(nums) {
  if (nums.length === 0) return 0;

  let total = nums.pop();

  return total += sum(nums);
}


console.log(sum([1, 2, 3]) === 6);
console.log(sum([10, 15, 20, 10, 5]) === 60);
console.log(sum([-5, -1, 5, 2, -3]) === -2);
console.log(sum([7]) === 7);
console.log(sum([]) === 0);

// All test cases should log true.