/*
Given an array nums, sorted in ascending order (where elements are equal to or increase as you move through the array), determine if a specified number, target, appears more than three times in the array. The function should return true if target is found at least four times, and false otherwise.

--- Problem
iNPUT: array of sorted integers, target integer `t`
OUTPUT: boolean true or false
  
  Rules:
    - Given: array of sorted ints smallest to largest
    - Return a boolean where
      - true if
        - target `t` appears more than 3x in the array
          - so 4 or more times
      - otherwise return false

Assumptions:
- Will the first arg always be an array?
  - Yes
- Will I ever be given an empty array?
  - Return false if so
- Will the elements always be whole numbers, i.e. integers?
  - Yes
- This includes positive and negative / 0?
  - Yes
- Will 2nd arg always be an integer?
  - Yes
- Can it be negative or 0?
  - Yes
- Will I need to handle missing args?
  - No, always precisely 2 args passed

--- Examples
- given: [1, 2, 3, 3, 3, 3, 4], 3 return -> true
  - `t` = 3
  - 3, 3, 3, 3
  - count = 4
  -> return true

- given: [1, 2, 3, 4, 5], 2) return false
  - `t` =2
  - 2
  - count = 1
  - return false

--- DS
- given ana rray
- can loop thru elements using binary search to improve time complexity
-
--- Algorithm
1. If `t` doesnt exist in array, return false
2. Set firstOccurrence and lastOccurrence of `t` to the repsective index positions
  - set left to 0 right to end of arr index
  - find mid index 
  - while left <= right
    - if the mid element === `target` 
      - set firstindex to mid
      - reassign right to mid - 1
    - else if mid element is < `target`
      - reassign left to mid + 1
    - else
      - reassign right to mid - 1
  - return first index

  ---- same process for left occurr
  - while left <= right
    - if the mid element === 'target`
      - set lastidx to mid
      - reassign left to mid + 1
    - else if mid element is < 'target
      - reassign left to mid + 1
    - else
      - reassign right to mid - 1
  - return lastindex

3. check the difference between lastocc and firstocc and increment it by 1
4. return if difference > 3
*/


function isTargetFrequent(nums, target) {
  let first = findFirstIdx(nums, target);
  let last = findLastIdx(nums, target);

  return last - first + 1 > 3;
}

function findFirstIdx(nums, t) {    // 't' === target number
  let [left, right] = [0, nums.length - 1];
  let firstIdx = -1;
  
  while (left <= right) {
    let mid = Math.floor((left + right) / 2);
    if (nums[mid] === t) {
      firstIdx = mid;
      right = mid - 1;
    } else if (nums[mid] < t) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return firstIdx;
}

function findLastIdx(nums, t) {     // `t` === target number
  let [left, right] = [0, nums.length - 1];
  let lastIdx = -1;
  
  while (left <= right) {
    let mid = Math.floor((left + right) / 2);
    if (nums[mid] === t) {
      lastIdx = mid;
      left = mid + 1;
    } else if (nums[mid] < t) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return lastIdx;
}


console.log(isTargetFrequent([1, 2, 3, 3, 3, 3, 4], 3) === true);
console.log(isTargetFrequent([1, 1, 1, 1, 2, 3, 4], 1) === true);
console.log(isTargetFrequent([1, 2, 3, 4, 5], 2) === false );
console.log(isTargetFrequent([1, 1, 3, 4, 5], 2) === false );
console.log(isTargetFrequent([2, 2, 2, 3, 3, 3, 4], 3) === false);
console.log(isTargetFrequent([4, 4, 4, 4, 4, 4, 4], 4) === true);
console.log(isTargetFrequent([], 3) === false);
// All test cases should log true.