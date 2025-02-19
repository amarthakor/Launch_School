// Write a program that cleans up user-entered phone numbers. Other than digits, the number may also contain special character such as spaces, dash, dot, and parentheses that should be ignored.


// If the phone number is less than 10 digits, assume that it is a bad number.
// If the phone number is 10 digits, assume that it is good.
// If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits.
// If the phone number is 11 digits and the first number is not 1, then it is a bad number.
// If the phone number is more than 11 digits, assume that it is a bad number.
// For bad numbers, just a return a string of 10 0s.

/*
----- PROBLEM
INPUT: string phone number
OUTPUT: string

Rules:
  - If phone num less than 10 digits, assume bad num
    - Return string of `0000000000`
  - If phone num == 10 digits, assume it is good num
  - If phone num == 11 digits and first digit is 1, remove first digit and use
    digits 2-11
  - If phone num == 11 digits and first digit is not 1, assume bad num.
  - if phone number is more than 11 digits, assume bad numer

- Will the phone number be supplised as a string or some other data type such as array?
  - Assume string always
- What should we do if we encounter empty strings?
  - Return 10 0s
- What to do if multiple args?
  - Ignore additional argumnets
- Is there a limit to the string arg
  - No, but assume it wont go over 50 chars
- Are digits only 0-9?
  - Yes
- How should consecutive digits be interpreted?
  - As individual digits. Ex. '100' is composed of 3 digit, '1', '0', '0';
- Will the arg ever contain any chars besides spaces, dots, dashes, and parantheses?
  - Only contain digits and the 4 states chars

----- EXAMPLES

- validNum('asdasd123456789') === '000000000';
  - Here string is over 10 chars but only has 9 digits therefore bad num

- validNum('-- .. 12345 67 k 89 1') === '1234567891';
  - mult char long string
  - only contains 10 digits
  - after being cleansed of nonwanted chars, left with final answer
    -> '1234567891'

- validNum('-- .. 12345 67 ( 89 9 ) 9') === '2345678999';
  - this string contains 11 digits
  - first digit is 1
  - create entire digit string and then remove first char?
    -> '12345678999' === 12 chars long
    -> chop off first digit
    -> '2345678999' === 11 chars long and good number

- validNum('(222)-345-12390') === '0000000000';
  - strong cpntaons 11 digits
  - first digit starts with 2
  - therefore bad number
  -> return '0000000000'

- validNum('11111111111111111111') === '0000000000';
  - string contains more than 11 digits
  - therefore bad number
  - return '0000000000'

----- DATA STRUCTURES
- could use an array to iterate thru string, but REGEX will work
  fine in this case to remove unwanted chars

----- ALGORITHM
1. Remove all unwanted chars (spaces, dots, dashes, parantheses) from string
  - Can use regex to remove all unwanted chars
  - initialize to `number`

2. Process the number and return it if it matches a good number condition
  - If `number` is 10 digits long
    - return `number`
  - If `number` is 11 digits long and the first digit is '1'
    - return `number`

3. Return the string '0000000000'
  - Return '000000000' at end of function

*/

function validNum(num) {
  if (num === '') return '0000000000';
  let number = num.replace(/[^0-9]/g, '');
  if (number.length === 10) return number;
  if (number.length === 11 && number[0] === '1') return number.slice(1);

  return '0000000000';
}

console.log(validNum('') === '0000000000');
console.log(validNum('asdasd123456789') === '0000000000');
console.log(validNum('-- .. 12345 67 ( 89 9 ) 9') === '2345678999');
console.log(validNum('-- .. 12345 67 ( 89 1') === '1234567891');
console.log(validNum('(222)-345-12390') === '0000000000');
console.log(validNum('11111111111111111111') === '0000000000');
console.log(validNum('22222222222') === '0000000000');