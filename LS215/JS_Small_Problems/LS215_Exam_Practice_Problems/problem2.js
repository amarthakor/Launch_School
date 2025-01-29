// Write a function that displays a four-pointed diamond in an nxn grid, where n is an odd integer supplied as an argument to the function. You may assume that the argument will always be an odd integer.

/*
  ----- PROBLEM -----
INPUT: Given an integer
OUTPUT: 4 pointed `diamond` logged to console

Rules:
  - Input will always be an odd integer
  - Logged `diamond` will print '*' to the console in an `n` by `n` grid,
    where `n` is the odd integer supplied
  - If `1` oassed to func, return `*`
  - Number passed to argument correlates with lines of stars logged to console
  - Top half is `reflected` in bottom half
  - Mid point of `diamond` contains `n` stars
  - Each row of stars above and below the mid point change by +/- 2 stars
  - If no stars, fill up grid with `' '`
  - Midline can be determined by `n` / 2 and rounding up
    - 5 / 2 = 2.5 -> 3
    - 9 / 2 = 4.5 -> 5
Assumptions:
  - If integer passed is negative
    - Return null
  - If non odd integer is passed
    - Return null
  - Is there a min or max limit on integer argument?
    - Assume no max limit, min limit will be 1

  ----- EXAMPLES -----
diamond(3);
  // logs
 *  | whitespace star whitespace - 1 star, + 2stars next line
*** | star star star            -> midline, 3 stars, - 2 stars next line
 *  | whitespace star whitespace -> 1 star

diamond(5);
  // logs
  *  |  top of diamond, 1 star
 *** |  top of diamond 3 stars
*****| star star star star star -> midline 5 stars
 *** |  bottom of diamond, 3 stars
  *  |  bottom of diamond 1 star

  ----- DATA STRUCTURES -----
- Array would allow easy iteration, but do not need an ordered list of items
- Object would provide for paired objects, but no need for associating any Key / Values...
- Use for loop to create diamond

  ----- ALGORITHM -----
- Check if Valid argument
  - Return null if argument is not an odd positive integer
- LOG first half of diamond
  - Find starting space amount and set to space variable
    - Math.floor( `n` / 2);
  - Set stars to 1
  - set linesOfStars to 0
  - log to console '{' ' * multipler}{* times multipler}{' ' * multipler}'
  - if linesofstars is less than midpoint Math.ceil(`n`  / 2)
    - decrement space value by - 1
  - If lineof stars is more than midpoint
    - increment space value by + 1
  - If linesOfStars is less than midpoint
    - Increment stars by + 2
  - If linesof stars is equal to or more than midpoint  
    - decrement stars by - 2
  - break out of loop when linesofstars is <= `n`

*/

function diamond(sizeOfDiamond) {
  if (!Number.isInteger(sizeOfDiamond) ||
      sizeOfDiamond <= 0 ||
      sizeOfDiamond % 2 === 0) return null

  let space = (Math.floor(sizeOfDiamond / 2));
  let stars = 1;
  let midpoint = Math.ceil(sizeOfDiamond / 2);

  for (let currentLine = 1; currentLine <= sizeOfDiamond; currentLine += 1) {
    console.log(`${' '.repeat(space)}${'*'.repeat(stars)}${' '.repeat(space)}`);
    if (currentLine < midpoint) space -= 1;
    if (currentLine >= midpoint) space += 1;
    if (currentLine < midpoint) stars += 2;
    if (currentLine >= midpoint) stars -= 2;
  }
}

// FIGURE OUT HOW TO REPEAT CHARACTERS

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

console.log(diamond(0)); // null
console.log(diamond('hi')); // null
console.log(diamond(-1)); // null