// Write a function called swap that takes a string as an argument, and returns a new string, where the alphabetic characters have taken the place of the numeric characters, and vice versa.

/*
----- PROBLEM -----
INPUT: string
OUTPUT: string

*/


// Examples / Test Cases
console.log(swap("1a2b3c"))// === "a1b2c3");           // true
console.log(swap("abcd123"))// === "123dabc");         // true
// console.log(swap("") === "");                       // true
// console.log(swap('!@#$%!#$@!') === '!@#$%!#$@!');   // true
// console.log(swap('123###') === '123###');           // true
// console.log(swap('abc###') === 'abc###');           // true
// console.log(swap('123$##$!abc') === 'abc$##$!123'); // true
// console.log(swap('123###abcd') === 'abc###123d');   // true
// console.log(swap(1) === null);                      // true
// console.log(swap([]) === null);                     // true
// console.log(swap('abcd123', 'abc') === '123dabc');  // true