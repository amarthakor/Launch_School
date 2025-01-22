// Write a function called swap that takes a string as an argument, and returns a new string, where the alphabetic characters have taken the place of the numeric characters, and vice versa.

/*
----- PROBLEM -----
INPUT: string of chars
OUTPUT: string of chars

Rules:
- Alphabetical chars are switched with numerical chars and
  numerical chars are switched with alphabetical chars

Assumptions:
- What to do if given an empty string?
  - Return empty string
- What to do if given a non string argument?
  - Only string args will be provided
- What to do if multiple string args are provided?
  - Only one string arg will be provided
- What to do if string contains nonalphanumerical chars?
  - nonalpha chars should remain untouched
- What if string arg is provided with no alpha / num chars?
  - Return string as given
- Is there a lower and upper limit on string length?
  - Assume srtings of less than 200 chars will be provided
- Are alpha chars / numbers linked? As in, does `a` correspond with `1`, `b` => `2`...
  `z` => `26`? Or are the characters swapped simply with the chars contained in the string?
    - Assume chars are swapped with the chrs conained in the string

- Appears as if strings that are even are swapped evenly
- Whereas odd strings have the odd char not swapped
----- EXAMPLES -----
(swap("1a2b3c") === "a1b2c3"); // true
  - string of 6 chars long; 'a1b2c3'
    - First char `1`, switched with first numerical char `a`
      - 'a12b3c'
    - Second numerical char `2` switched with second alpha char `b`
      - 'a1b23c'
    - Third numerical char `3` switched w third alpha char `c`
      - 'a1b2c3'

(swap("abcd123") === "123dabc"); // true
  - string of 7 chars long; 'abcd123'
    - First char 
----- DATA STRUCTURE -----


----- ALGORITHM -----

*/

function swap(str) {
  // ...
}



// Examples / Test Cases
console.log(swap("1a2b3c") === "a1b2c3"); // true
console.log(swap("abcd123") === "123dabc"); // true
console.log(swap("") === ""); // true
console.log(swap("12a") === "a21"); // true
console.log(swap("ab1") === "1ba"); // true
console.log(swap("abcd") === "abcd"); // true
console.log(swap("1") === "1"); // true
console.log(swap("123-4a#b$") === "ab3-41#2$"); // true
console.log(swap("ab1CD23") === "12a3DbC"); // true