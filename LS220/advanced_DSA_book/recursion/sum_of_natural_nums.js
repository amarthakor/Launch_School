// Create a function that calculates the sum of the first `n`
// natural numbers. A natural number is a positive integer
// starting from 1. Therefore, the sum of the first `n` natural
// numbers is the sum of all integers from 1 to `n`.

// For example, if `n` is 5, the sum would be 1 + 2 + 3 + 4 + 5 == 15.


/*
--- Problem
INPUT: integer
OUTPUT: integer

  Rules:
  - Given an integer `n`
  - Return an integer where;
    - integer is a sum
    - sum is composed of the first `n` integers
    - these `n` integers are all natural numbers
    - a natural number is a pos integer starting from 1
    - thus sum of the first `n` natural numbers is basically
    - numbers 1...`n` summed together
  - What is my base case?
    - When `n` is 1 we return 1
  - What is my recursive case?
    - When `n` is > than 1, we make a recusrive call to our functionm
  - What is my recursion step?
    - Finding `n - 1` to find the sum of natural numbers from `n` to 1

Assumptions
- Will we always be provided a positive number?
  - Always integer but may not be positive
- How should we handle 0 or negative numbers
  - 0 return 0, negative number return 0
- Will I ever be given a non integer argument>
  - No arg will always be 0
- What about additional args?
  - Only 1 argument will be provided

--- Examples
Given 1 return 1
  - sum of 1to `n`n
  - thus we have 1
  - return 1
  * base case may be this?
 
Given 0 return 0
  - 0 < 1
  - return 0

Given 5, return 15
  - 1...5 -> 1, 2, 3, 4, 5
  - 1+ 2 + 3+ 4 + 5 = 15
  -> 15

given 10 return 55
  - 1, 2, 3, 4, 5,6 ,7, 8, 9, 10 -> total sum is 55
  -> 55

--- DS
- Since we are finding a sum we dont need to rely on  an array
- can use recursion to find all nums from `n`n to 1

--- Algorithm
1. If `n` is less than 1, return 0
2. If `n` is 1, return 1 ** base case
3. Return the sum of `n` ... 1
  - n + a recursive call to `n` - 1
  - this will invoke a recursive call all the way to 1 and then sum
    up 1...`n`
*/

function sumOfNaturalNumbers(n) {
  if (n < 1) return 0;
  if (n === 1) return 1;

  return n + sumOfNaturalNumbers(n - 1);
}

console.log(sumOfNaturalNumbers(1) === 1);
console.log(sumOfNaturalNumbers(5) === 15);
console.log(sumOfNaturalNumbers(10) === 55);
console.log(sumOfNaturalNumbers(20) === 210);
console.log(sumOfNaturalNumbers(0) === 0);
console.log(sumOfNaturalNumbers(-2) === 0);

// All test cases should log true.