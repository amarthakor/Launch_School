/*

In this problem, you're presented with a nested array, matrix, which has two key characteristics:

Each subarray in the matrix is sorted in ascending order.
The first element of each subarray is larger than the final element of the preceding subarray.
Your task is to determine whether a given integer, target, exists within this nested array.

The time complexity of your solution should be O(log(M*N)).

--- Problem
INPUT: nested array
OUTPUT: return boolean

  Rules:
  - Given nested array (matrix)
    - each subarray is sorted in asc order (smallest -> largest)
    - 1st element in next array is larger > than last element in prior array
  - Return
    - if an integer `t` exists in the nested array
  - Time complexity should be O(log(M*N))
    - O(logN) for each subarr, M = total # of subarrs
  
Assumptions
- Is it safe to assume all elements within arg will be subarr and all
  elements w/n subarr will be integers?
  - yes
- Will integers ever be negative or 0?
  - possibly
- How to handle empty array arg?
  - REturn false
- Will second arg ever be missing or non int arg?
  - If non int arg reutrn null
  - If missing return null
- Will second arg always be an integer?
  - Yes
- Will second arg potentially be negative or 0?
  - Yes
- How to handle non array arg?
  - Return null
- Is there an upper bounds on how many nested array / size of each subarr might be?
  - Assume there are no bounds

--- Example
Given: [[4, 8, 12], [16, 20, 24], [28, 32, 36]], 20 -> return true
  - target `t` = 20
  - 4, 8, 12, 16, 20 -> match -> true

Given: [1, 3, 5], [7, 9, 11], [13, 15, 17]], 19 -> return false
  - 1, 3, 5, 7, 9, 11, 13, 15, 17
  - no match
  -> return false

--- DS
- Given a nested array
- Want to find a target match in o(logM*N)
- can utilize a double binary search

--- Algorithm
1. Handle all null / edge cases
  - return null if non array or non int arg
  - return false if arr size === 0
2. Set targetSubarr;
3. Select the correct subarr #first binary search
  - Set left to 0, right to arr size - 1
  - while left is <= right
    - select the middle subarr; mid = left + right / 2 floor
    - check first element and last element in midd subarr
    - if `t` is greater than or >= subarr[0] and less then <= subarr[max]
      - the current subarr MAY hold the target, thus we assign it to 
        targetsubarr and return early
    - if 't' is >= subarr[max]
      - reassign left to mid + 1
    - else 't' is <= subarr[0]
      - reassign right mid - 1
  
4. Within the subarr, find a match #second binary search
  - set left to 0, right to arr size - 1
  - while left os <= right
    - find mid element, left + right / 2 floor
    - if subarr[mid] is === `t`
      - return true
    - if subarr[mid] is < 't'
      - reassign left to mid + 1
    - else
      - reassign right to mid - 1
5. Return false
*/

function findInNestedArray(matrix, target) {
  if (!Array.isArray(matrix) || !Number.isInteger(target)) return null;
  let targetSubarr = findSubArr(matrix, target);
  let targetNum = findTarget(targetSubarr, target);
  return targetNum;
}

function findSubArr(matrix, target) {
  let [left, right] = [0, matrix.length - 1];
  let targetSubarr;

  while (left <= right) {
    let mid = Math.floor((left + right) / 2); // middle subarray index
    let lastIdx = matrix[mid].length - 1;     // last index of middle subarr

    if (target >= matrix[mid][0] && target <= matrix[mid][lastIdx]) {
      return targetSubarr = matrix[mid];
    } else if (target > matrix[mid][lastIdx]) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return targetSubarr;
}

function findTarget(array, target) {
  if (!Array.isArray(array)) return false;
  let [left, right] = [0, array.length - 1];

  while (left <= right) {
    let mid = Math.floor((left + right) / 2);
    if (array[mid] === target) {
      return true;
    } else if (array[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return false;
}


console.log(findInNestedArray([], 2) === false);
console.log(findInNestedArray(1, 2) === null);
console.log(findInNestedArray([], []) === null);
console.log(findInNestedArray([[4, 8, 12], [16, 20, 24], [28, 32, 36]], 20) === true);
console.log(findInNestedArray([[3, 6, 9], [12, 15, 18], [21, 24, 27]], 27) === true);
console.log(findInNestedArray([[1, 3, 5], [7, 9, 11], [13, 15, 17]], 19) === false);
console.log(findInNestedArray([[10, 20, 30], [40, 50, 60], [70, 80, 90]], 10) === true);
console.log(findInNestedArray([[15, 25, 35], [45, 55, 65], [75, 85, 95]], 5) === false);

// All test cases should return true.