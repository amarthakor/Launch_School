/*
Write a function that checks whether a given positive integer num is the result of an integer multiplied by itself, which is typically referred to as a square integer. The function should return true if num is a square integer, otherwise false. The implementation should not rely on any square root computation provided by built-in Math library.
6:45pm

--- Problem
iNPT: integer
OUTPUT: boolean true false

  Rules:
    - Given an integer
      - positive whole number
    - Return boolean true/false
      - if given positive number is a square integer
      - this means that a number times itself === the given number
      - in this case our number itself is not actually getting squared
    - Cannot use #sqrt provided byMath library
  
Assumptions
- Will we always receive an integer
  - yes
- Will it always be positive?
  - Yes, never 0 or negative
- What about additionala rgs?
  - ignore additional arguments

--- Examples
- Given 1 return true
  1 * 1 === 1

- Given 4 return true
  2 * 2 === 4

- Given 5 return false
  1*5 is not a square since there are two different numbers

- given 14 return false
  -1, 2, 7, 14
  - no possible square integer to achieve 14, return false

--- DS
- could use array of 1...integer
- thise would be O(N) however
- need to maintain O(llogN) time complex for binary search
- will utilize while loop

--- Algorithm
1. set start to 1, end to target
2. See if any number in our range is itself * itself === target
- While start is <= target
  - set mid to target + start / 2 rounded down
  - if mid number * itself is === target
    - return true
  - else if mid number * itself is greater than target
    - set end to mid - 1
  - else 
    - set start to mid + 1
  
3. Return true if match found, false otherwise
*/

function isSquareInteger(num) {
  let [start, end] = [1, num];

  while (start <= end) {
    let mid = Math.floor((start + end) / 2);
    if (mid * mid === num) {
      return true;
    } else if (mid * mid > num) {
      end = mid - 1;
    } else {
      start = mid + 1;
    }
  }

  return false;
}

console.log(isSquareInteger(1) === true);
console.log(isSquareInteger(4) === true);
console.log(isSquareInteger(16) === true);
console.log(isSquareInteger(14) === false);
console.log(isSquareInteger(25) === true);
console.log(isSquareInteger(26) === false);

// All test cases should log true.