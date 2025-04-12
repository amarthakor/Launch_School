// Write a function `findMax` that finds the maximum element in
// a rotated sorted array.

// A rotated sorted array is an array that was originally sorted
// in ascending order, but has been rotated (shifted) by some
// number of positions. The function should take an array of
// integers as input, representing the rotated sorted array,
// and it should return the maximum element in the array.
// The array is guaranteed to have at least one element.

// The solution should be in O(logN) time complexity.

/*
--- Problem
INPUT: array of ints
OUTPUT: integer

  Rules:
    - Given input is going to be an array of ints that has
      been sorted from small -> large and then shifted x
      amoutn of times
    - Find the maximum value in this rotated sorted array
    - Solution should be oLogN time complex
    - Array will have at least one element

Assumptions
- Will elements in array always be integers?
  - Yes
- Can they be 0 or negative?
  - Yes
- Will we ever be given a non array arg?
  - No, arg will always be an array of length = 1 w/ integers
- Will we ever be provided w/ additional args?
  - No, precisely one arg always

--- Examples
- Given [8, 9, 10, 2, 5, 6] -> return 10
  - been shifted `x` amount of times, which we dont know
  - unshift it and it becomes [2, 5, 6, 8, 9, 10]
  - already sorted but just shifted out of order
  --> looking for largest val = 10
  -> return 10

- Given [15, 18, 2, 3, 6, 12] -> return 18

- Given [7, 8, 2, 3, 4, 5, 6] -> return 8
  - check middle ele -> 3
  -> left is 2, right is 4
  -> check right side
  -> max is 6
  -> return 6, but max is 8...
  ---
  -> check middle ele -> 3
  - perform left side BS and right side BS
  - left side = index 0... 3, right side = index 5..6
  -> middle element is 8 on left, 5 on right
  -> can implement double search to find max on each side
  - leftmax = 8, right max = 6
  -> 8>6 return 8

--- DS
- given array that is sorted and then rotated
- given max ele can be anywhere in array
- binary search fits oLogN
- how to find max element since array is sorted but shifteD?
- would double binary search work, one left one right?

--- Algorithm
1. If array size is 1, return arr[0]
2. Set middle index to middle index of arr
3. Find left side max ** BS HELPER1 **
- Set left to 0, right to middle index from step 2
- while left is <= right
  - let middle = left + right / 2 floor
  - if the ele at middle is greater than left and right elements
    - return the element
  - elseif the element on the left is greater than the middle element
    - reassign right to mid - 1
  - else
    - reassign elft to mid + 1

4. Find right side max ** BS HELPER2 **
- Set left to middle index from step 2 + 1, right end of arr size - 1
- while left is <= right
  - let middle = left + right / 2 floor
  - if the ele at middle is greater than left and right elements
    - return the element
  - elseif the element on the left is greater than the middle element
    - reassign right to mid - 1
  - else
    - reassign elft to mid + 1

5. Return the greater of leftside Max vs right side max
*/

// Example:
// Input: nums = [8, 9, 10, 2, 5, 6]
// Output: 10
// Explanation: The original sorted array [2, 5, 6, 8, 9, 10]
//              was rotated 3 times.

function findMax(nums) {
  if (nums.length === 1) return nums[0];
  let midIndex = Math.floor((nums.length - 1) / 2);

  let leftMax = findLeftMax(nums, midIndex);
  let rightMax = findRightMax(nums, midIndex);

  return Math.max(leftMax, rightMax);
}

function findLeftMax(nums, midIndex) {
  let [left, right] = [0, midIndex];

  while (left <= right) {
    let mid = Math.floor((left + right) / 2);
    if (nums[mid] > nums[mid + 1] && mid === 0) {
      return nums[mid];
    } else if (nums[mid] > nums[mid + 1] && nums[mid] > nums[mid - 1]) {
      return nums[mid];
    } else if (nums[mid] < nums[mid - 1]) {
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }

  return -Infinity;
}

function findRightMax(nums, midIndex) {
  let [left, right] = [midIndex + 1, nums.length - 1];

  while (left <= right) {
    let mid = Math.floor((left + right) / 2);
    if (nums[mid] > nums[mid - 1] && mid === nums.length - 1) {
      return nums[mid];
    } else if (nums[mid] > nums[mid + 1] && nums[mid] > nums[mid - 1]) {
      return nums[mid];
    } else if (nums[mid] < nums[mid - 1]) {
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }

  return -Infinity;
}

console.log(findMax([8, 9, 10, 2, 5, 6]) === 10);
console.log(findMax([15, 18, 2, 3, 6, 12]) === 18);
console.log(findMax([7, 8, 2, 3, 4, 5, 6]) === 8);
console.log(findMax([3, 1]) === 3);
console.log(findMax([5]) === 5);
console.log(findMax([9, 10, 11, 12, 13, 14, 15, 1, 2, 3]) === 15);
console.log(findMax([4, 5, 1, 2, 3]) === 5);
console.log(findMax([23, 34, 38, 40, 41, 14, 15, 16, 17, 18, 19, 20, 21]) === 41);
console.log(findMax([100, 200, 300, 400, 500]) === 500);
console.log(findMax([45, 47, 49, 51, 53, 55, 57, 59, 61, 63, 44]) === 63);
console.log(findMax([11, 13, 15, 17, 19, 21, 1, 3, 5, 7, 9]) === 21);