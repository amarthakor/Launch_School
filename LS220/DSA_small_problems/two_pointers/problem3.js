/*
In this problem, you're given an array of integers nums and a target integer target. Your objective is to find the maximum sum that can be obtained by adding two distinct elements from the array, where this sum is less than the target.

Requirements:

The input will be an array of integers, nums, and a target integer, target.
You need to find the maximum value of nums[i] + nums[j] where i != j and nums[i] + nums[j] < target.
If no such pair exists, return -1.


--- Problem
INPUT: array and integer
OUTPUT: integer

  Rules:
    - Given an array of integer and a target integer `t`
    - Find the max sum that can be found by:
      - adding to distinct elements from the array
      - sum must be less than the target
      - what does `distinct` mean?
        - cannot be same element twice
    - If there is no pair that meets these criteria
      - return -1


--- Examples
- Given: [3, 1, 4], 5 Return 4
  - 3 + 1 = 4 < 5 YES
  - 3 + 4 = 7 < 5 NO
  - 1 + 4 = 5 < 5 NO
  -> 4

- Given: [1, 2, 4, 5, 7, 8, 9, 10], 16... Return 15
- 1 + 10 == 11 < 16 YES
- 2 + 10 == 12 < 16 YES
- 4 + 10 == 14 < 16 YES
- 5 + 10 == 15 < 16 YES
- 7 + 10 == 17 < 16 NO
- 7 + 9 == 16 < 16 NO
- 7 + 8 == 15 < 16 YES

--- DS

--- Algorithm
1. Sort array
2. Set start to 0 , end to end of array
3. set max Val to -1
4. Loop over array and find max Val
- While start < end
  - IF arr[s] + arr[e] is < target `t`
    - set max Val to arr[s] + arr[e]
    - increment start by += 1
  - IF arr[s] + arr[e] is > `t`
    - decrement end by -= 1
  
5. return max Val
*/

function twoSumLessThanTarget(nums, t) {
  nums.sort((a, b) => a - b);
  let start = 0;
  let end = nums.length - 1;
  let maxVal = -1;

  while (start < end) {
    if (nums[start] + nums[end] < t) {
      if (maxVal < nums[start] + nums[end]) maxVal = nums[start] + nums[end];
      // maxVal = Math.max(maxVal, (nums[start] + nums[end]));
      // more succint solution
      start += 1;
    } else {
      end -= 1;
    }
  }

  return maxVal;
}


console.log(twoSumLessThanTarget([3, 1, 4]));
console.log(twoSumLessThanTarget([3, 1, 4], 5) === 4);
console.log(twoSumLessThanTarget([8, 2, 4, 9, 5, 10, 1, 7], 16) === 15);
console.log(twoSumLessThanTarget([5, 8, 3, 2, 1], 6) === 5);
console.log(twoSumLessThanTarget([6, 8, 10, 12], 5) === -1);
console.log(twoSumLessThanTarget([1, 2, 3, 4, 5], 100) === 9);
console.log(twoSumLessThanTarget([10, 20, 30, 40, 50], 40) === 30);
console.log(twoSumLessThanTarget([7, 4, 15, 11, 21, 9], 24) === 22);

// All test cases should log true