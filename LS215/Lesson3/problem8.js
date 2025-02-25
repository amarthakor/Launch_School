// Write a function that displays a four-pointed diamond in an nxn grid, where n is an odd integer supplied as an argument to the function. You may assume that the argument will always be an odd integer.

/*
---- PROBLEM
INPUT: an odd integer `n`
OUTPUT: a `four-pointed diamond` in an `n` by `n` grid thats displayed to the console

Rules:
  - One input - odd integer
  - Instead of specific return value, output logged to console instead
    - Output is a 4 pointed diamond
    - Diamond is in an `n` by `n` grid where `n` is the arg passed into the func
    - `n` by `n` grid is formed of spaces and *
  - Starting space row 1 is equal to `n` / 2 rounded downwords
    - 9 / 2 = 4.5 -> 4
    - Math.floor(n/2);
  - Each subsequent row decrements the amount of spaces on each side by 1 up until the midpoint
  - Meanwhile, starting row 1 star is 1 star
    - Each row is incremented by 2 stars up until the midpoint

*** FIRST HALF DIAMOND ***
  - Starting space for row 1 is equal to Math.floor(stars / 2)
    - This value is then decremented by 1 on each row upto midpoint
  - Starting star is 1 for row 1
    - This value is then incremented by 2 on each row upto midpoint

Assumptions:
- How should we respond if an even integer is passed?
  - Return null
- What if 0 or a negative or special number are passed?
  - Return null
- What if a non integer type is passed?
  - Return null
- How should we handle multiple arguments?
  - Ignore additional args
- Should we expect a maximum value?
  - There is no upper limit to this problem
- Should we have an explicit return value or just focus on outputing the diamond
  to the console?
  - Focus on outputting diamond to consle

---- EXAMPLES
diamon(1)

diamond(3)
 - Given 3
  - Need to make 4 pointed diamond in `n` by `n` square; 3 x 3 square
  - Formed of * and ' '
 *
***
 *
  - seems as if each row upto the midline increases by 2 *'s
  - top half and bottom half are reflections of each other in reverse order
  - so maybe can print out top half then reverse instructions to print out bottom half

diamond(9)
- Given 9, valid odd int
  - 9x9 grid of spaces and *'s

*** FOR FIRST HALF ***
  - space = 4, stars = 1 

*** FOR BOTTOM HALF ***
  - starting stars is equivalent to `n` - 2; 9 - 2 = 7
    - Each row this stars value is decremented by 2
  - starting space is equivalent to 1
    - Each row this space value is incremented by 1
  - space = 1, stars = 7
1.'    *    \n'
2.   ***   
3.  *****  
4. ******* 
5.*********
6. ******* 
7.  *****  
8.   ***   
9.    *    

diamond(-1); // null
  - Negative arg; return null

// diamond(0); null
  - Return null for all pos/ 0 ints
// diamond(Infinity); null
  - Return null due to invalid integer

// diamond([]); null
  - Return null due to non int data type

diamond(3, 5); // same as diamond(3) from above
1. *
2.***
3. *
- Ignore the add'l arg

---- DS
- KV pairing doesnt seem ideal
- Array would allow us to iterate easily, but dont need ordered collection
- for loop might be ideal

---- ALGO
1. Return null for invalid conditions
2. Generate first half of diamond upto and including the midline ** HELPER **
3. Generate the second half of diamond not including midline ** HELPER **
4. Output this diamond to the console

** HELPER func firstHalfDiamond
1. Find the initial amount of spaces, Math.floor(`n` / 2)
2. Init stars to 1
3. Init `firstHalf` to empty string ''
4. Generate each line of the first half of diamond
  - For each line (upto `n` / 2 rounded up #ceil)
    - Create a string of 'spaces|stars|spaces\n' #repeat method
    - Add the string to `firstHalf
5. Return `firstHalf`

** HELPER func secondHalfDiamond
1. Find the initial amount of stars, `n` - 2
2. Init spaces to 1
3. Init `secondHalf` to empty string ''
4. Generate each line of the second half of diamond
  - For each line (`n` /2 rounded down)
    - Create a string of 'spaces|stars|spaces\n` #repeat method
    - Increment the string to `secondhalf`
5. Return secondhalf

*/

function diamond(stars) {
  if (stars % 2 !== 1 || stars < 1) return null;
  let diamond = '';
  diamond = firstHalfDiamond(stars) + bottomHalfDiamond(stars);
  console.log(diamond);
}

function firstHalfDiamond(totalStars) {
  let stars = 1;
  let spaces = Math.floor(totalStars / 2);
  let firstHalf = '';
  let totalRows = Math.ceil(totalStars / 2);
  let str = '';

  for (let row = 1; row <= totalRows; row += 1) {
      str = `${' '.repeat(spaces)}${'*'.repeat(stars)}${' '.repeat(spaces)}\n`;
    firstHalf += str;
    stars += 2;
    spaces -= 1;
  }

  return firstHalf;
}

function bottomHalfDiamond(totalStars) {
  let stars = totalStars - 2;
  let spaces = 1;
  let secondHalf = '';
  let totalRows = Math.floor(totalStars / 2);
  let str = '';

  for (let row = 1; row <= totalRows; row += 1) {
    if (row !== totalRows) {
      str = `${' '.repeat(spaces)}${'*'.repeat(stars)}${' '.repeat(spaces)}\n`;
    } else {
      str = `${' '.repeat(spaces)}${'*'.repeat(stars)}${' '.repeat(spaces)}`;
    }
    secondHalf += str;
    stars -= 2;
    spaces += 1;
  }

  return secondHalf;
}
// console.log(firstHalfDiamond(9));
diamond(1);
// logs
// *

diamond(3);
// logs
//  *
// ***
//  *

diamond(9);
// logs
//     *
//    ***
//   *****
//  *******
// *********
//  *******
//   *****
//    ***
//     *

console.log(diamond(-1)); // null
console.log(diamond(0)); // null
console.log(diamond(Infinity)); // null
console.log(diamond([])); // null
console.log(diamond(4)); // null
diamond(3, 5); // same as diamond(3) from above 