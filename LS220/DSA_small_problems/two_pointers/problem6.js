/*

You have an ordered array nums consisting of integers. Your task is to determine whether there are any two distinct elements in the array where one element is exactly three times the value of the other element. The time complexity of the solution should be O(N).

Restrictions:

You should not use built-in methods like filter, map, reduce, or find.
Do not use the includes method for checking existence in the array.
Avoid using indexOf or lastIndexOf.

--- Problem
INPUT: given an array of integers
OUTPUT: return boolean

  Rules:
    Given an ordered array of ints
    Return a boolean where:
      - true if:
        - one element is 3x the value of the another element
    - time complex should be O(N)
    - cant use built in methods such as filter, map reduce, find etc.
    - can't use #includes, indexOf, or lastIndexOf

Assumptions:
- Will I ever recei ve an empty array?
  - Return false if given []
- Will there always be oNLY integers in the given array?
  - Yes, no other data types
- Can the integers ever be negative / 0
  - POssibly
- How to handle non array args?
  - Only provided array arguments
- What about additional args?
  - Ignore add'l args
- How to handle arrays with only 1 element?
  - Return false
--- Examples:
- Given [] -> false
- Given ([1, 3, 9, 28])) -> true
  - 1, 3, 9, 28
  - 3 is === 1x3
  - 9 is === 3x3
  - return true 2 valid matches

- Given [0, 5, 7, 55] -> false
  - 0, 5, 7, 55
  - 0x3 = 3, 5x3 = 15, 7x3, 21 55x3 =165
  - return false

--- DS
- given an array
- can use while loop instead of iterating over array
- can employ start / end strategy or anchor runner
- anchor runner will find all possible matches
- start / end may miss possible matches
- go with anchor runner and exit once match is found

--- Algorithm
1. Handle edge cases
2. set anchor to 0, runner to 1
3. Find a possible match
- While anchor < nums length - 1
  - If anchorEle x 3 === runnerEle
    - return true
  - else if anchorEle x3 is greater > runnerEle
    - rubnner +1
  - else 
    - anchor + 1
    - runner = anchor + 1

4. Return false

([4, 5, 7, 9, 13, 15, 17])
anchor 0 runner 1
4x3=12 === 5? No 12 > 5
  -> runner + 1 = 2, anchor 0
12 > 7? No
  -> runner + 1 = 3, anchor 0
12 > 13? yes
  -> anchor + 1 = 1, runner 2
15 > 7 no
  -> runner = 3
*/

function checkTripleMatch(nums) {
  if (nums.length < 2) return false;
  let [anchor, runner] = [0, 1];

  while (anchor < nums.length - 1) {
    if (nums[anchor] * 3 === nums[runner] || nums[anchor] === nums[runner] * 3) {
      return true;
    } else if (Math.abs(nums[anchor]) * 3 > Math.abs(nums[runner])) {
      runner += 1;
    } else {
      anchor += 1;
      runner = anchor + 1;
    }
  }

  return false;
}

// function checkTripleMatch(nums) {
//   let anchor = 0, runner = 1;

//   while (runner < nums.length) {
//       if (nums[runner] === 3 * nums[anchor]) {
//           return true;
//       }

//       if (nums[runner] > 3 * nums[anchor]) {
//           anchor++;
//       } else {
//           runner++;
//       }
//   }

//   return false;
// }

console.log(checkTripleMatch([1, 3, 9, 28]) === true);
console.log(checkTripleMatch([1, 2, 4, 10, 11, 12]) === true);
console.log(checkTripleMatch([0, 5, 7, 55]) === false);
console.log(checkTripleMatch([4, 5, 7, 9, 13, 15, 17]) === true);
console.log(checkTripleMatch([2, 6, 13, 54]) === true);
console.log(checkTripleMatch([1, 5, 17, 51]) === true);
console.log(checkTripleMatch([1, 2, 4, 8]) === false);
console.log(checkTripleMatch([]) === false);
console.log(checkTripleMatch([1]) === false);
console.log(checkTripleMatch([1, 3]) === true);
// javascript

// Test cases with negative numbers
console.log(checkTripleMatch([-9, -6, -3, -1]) === true);  // -3 is 3 times -9

// Test cases with zeros
console.log(checkTripleMatch([0, 0, 0]) === true);  // 0 is 3 times 0

// Mixed negative and positive numbers
console.log(checkTripleMatch([-15, -5, 1, 5, 15]) === true);  // -5 is 3 times -15

// Test with array that has only one possible triple match at the end
console.log(checkTripleMatch([-100, -50, -25, 1, 75, 300]) === false);  // 300 is 3 times 100

// Single value tests
console.log(checkTripleMatch([0]) === false);  // Can't form a triple match with just one element

// Test with extremely large numbers
console.log(checkTripleMatch([1000000, 3000000]) === true);  // 3000000 is 3 times 1000000

// Additional edge cases
console.log(checkTripleMatch([-10, -5, -3, 10, 15]) === false);  // No triple matches
console.log(checkTripleMatch([Number.MIN_SAFE_INTEGER, Number.MAX_SAFE_INTEGER]) === false);  // Extreme values
// All test cases should log true.