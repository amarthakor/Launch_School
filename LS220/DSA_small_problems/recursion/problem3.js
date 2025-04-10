/*

Create a recursive function that counts the number of digits in a given integer. The function should accept an integer and return the count of its digits. For instance, if the input is 12345, the function should return 5.

--- Problem
INPUT: integer
OUTPUT: integer

  Rules:
  Given an integer
  return an integer where
    - represents the number of digits in the given integer argument
    - find count of digits recurisvely

  - Base case:
    - If given an integer under 10, I return 1
  - Recursive definition:
    - The count of digits in an integer is the first digit plus the count of the rest of the digits in the integer
*/

function countDigits(number) {
  if (number < 10 && number > -10) return 1;
  let count = 1;

  return count + countDigits(Math.floor(number / 10));
}


// Example test cases:
console.log(countDigits(-100000) === 6);
console.log(countDigits(-12345) === 5);
console.log(countDigits(-7) === 1);
console.log(countDigits(12345) === 5);
console.log(countDigits(7) === 1);
console.log(countDigits(100000) === 6);
console.log(countDigits(99999) === 5);
console.log(countDigits(0) === 1);

// All test cases should log true.