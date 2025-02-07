// Write a function that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the function. The smallest such star you need to handle is a 7x7 grid (i.e., when n is 7).

/*
----- PROBLEM -----
INPUT: an integer that is odd
OUTPUT: log an 8 pointed `star` in a `n x n` grid, where `n` is the odd int supplied

Rules:
  - Given input will be an integer that is ODD
  - Minimum value of integer will be 7
  - Star must contain exactly 8 `points`
  - Top half of star is a reflection of the bottom half
    - This does not include the midpoint row of the star
    - Thus, in a 7x7 star
      - Rows 1-3 are the same as 4-6, just reflected
        - Row 1 == row 6
        - Row 2 == row 5
        - Row 3 == row 4
        - Midpoint row is its own unique row
  - CREATE top half
  - CREATE midpoint
  - CREATE bottom half

Assumptions:
  - What to do if n is an even number?
    - Return null
  - What to do if n is less than 7?
    - assume n will always be at least 7 or greater
  - Is there a maximum limit to n?
    - Assume no upper limit
  - What to do if non integer value is given?
    - Return null

----- EXAMPLES -----
star(7)
  - need to log a star that is contained in a 7x7 grid as n = 7
  - line 1 contains '* 2 spaces * 2 spaces *'        = 7 spots (3 stars 4 spaces)
  - line 2 contains 'space * space * space * space'  = 7 spots (3 stars 4 spaces)
  - line 3 contains 'space space 3* space space'     = 7 spots (3 stars 4 spaces)
  - line 4 MIDPOINT 'star star star star star star star' = 7 spots (7 stars 0 spaces)
  - line 5 contains 'space space 3* space space' =   = 7 spots (3 stars 4 spaces)
  - line 6 contains 'space * space * space * space'  = 7 spots (3 stars 4 spaces)
  - line 7 contains '* 2 spaces * 2 spaces *'        = 7 spots (3 stars 4 spaces)

 - need beginning space and middle spaces, stars is set to 3
 - beginning space stars off as 0, middle psaces stars off at max space / 2 (2)
  - "(' ').repeat(edgeSpace) + ('*') + (' '.repeat(midSpace) + ('*') ...) " line 1
    - increment edgeSpace by 1, decrement midspace by 1 (now 1)
  - 1edgespace 1star 1midspace 1star 1midspace 1star 1edgespace line 2
    - increment edgespace by 1, decrement midpsace by 1 (now 0)
  - 2edgespace 3star 2 edgespace line 3
  - midpoint
  bottom half
    - edgespace is set to maxspace / 2 (in this case 2)
    - midSpace is set to 0
  - 2edgespace 3 star 2 edgespace
    - decrement edgespace by 1, increment midspace by 1
  - ' '.repeat(edgespace) + star + ' '.repeat(midpsace) + star ' '.repeat(mdsp) + star ' '.endspc
    1edge + 1star + 1mid + 1star + 1mid + 1star + 1edge

star(9)
  - line 1 contains '* 3 spaces * 3 spaces *'             = 9 spots (3 stars, 6 spaces)
  - line 2 contains 'space * 2 spaces * 2 spaces * space' = 9 spots (3 stars, 6 spaces)
  - line 3 contains '2 spaces * space * space * 2 spaces' = 9 spots (3 stars, 6 spaces)
  - line 4 cpmtains '3 spaces *** 3 spaces'               = 9 spots (3 stars, 6 spaces)
  - line 5 MIDPOINT '9 stars'                             = 9 spots (9 stars, 0 spaces)
  - line 6 cpmtains '3 spaces *** 3 spaces'               = 9 spots (3 stars, 6 spaces)
  - line 7 contains '2 spaces * space * space * 2 spaces' = 9 spots (3 stars, 6 spaces)
  - line 8 contains 'space * 2 spaces * 2 spaces * space' = 9 spots (3 stars, 6 spaces)
  - line 9 contains '* 3 spaces * 3 spaces *'             = 9 spots (3 stars, 6 spaces)

star(5)
  - return null since `n` must be at least 7

star('hello')
  - return null since `n` must be an integer type

star(8)
  - return null since `n` must be odd

----- DATA STRUCTURES -----
- Object seems unneccesary bc there appears to be no clear value of using an
  associated key value list for this problem...
- For an array, would allow iteration over each `line` but there seems to be 
  no clear association between the line number and whats being printed to the console
- Perhaps each line can be created and then appended to an array, which is then output to the display?
  - After testing, appears easier to create a string w/ newlines and long to display
- Will use for loop instead to create string

----- ALGORITHM -----
- return NULL if input is invalid
- CREATE a var `star` that will hold each row and be output to display

- CREATE top half of star and append it to `star`    helper method**
- CREATE midpoint of star and append it to `star'    helper method**
- CREATE bottom half of star and append it to `star  helper method**

- Log `star`

fn topHalf(n, star)
  - FIND total rows in top half and set to variable `rows` Math.floor(n / 2)
  - SET edgeSpace to 0
  - SET midSpace to n - 3
  - CREATE all rows of top Half star
    - Loop `rows` amount of times where
      - CREATE each row of stars and then append it to the `star` variable
        - edgespaces + star + midspaces + star + midspaces + star + edgespace

fn midpoint(n, star)

fn btmHalf(n, star)
  - FIND total rows in bot half and set to var `rows` Math.floor(n / 2)
  - SET edgespace to (n - 3) / 2
  - SET midspace to 0
  - CREATE all rows of bottom half star
    - edgespaces + star + midspaces + star + midspaces + star + edgespace

*/
function star(n) {
  if (n % 2 === 0 || typeof (n) !== 'number' || n < 7) return null;
  let starImage = '';

  starImage = topHalf(n);
  starImage += midPoint(n);
  starImage += bottomHalf(n);
  return starImage;
}

function topHalf(n) {
  let rows = Math.floor(n / 2);
  let endGap = 0;
  let midGap = (n - 3) / 2;
  let star = '';

  for (let i = 1; i <= rows; i += 1) {
    star += `${' '.repeat(endGap)}*${' '.repeat(midGap)}*` +
            `${' '.repeat(midGap)}*${' '.repeat(endGap)}\n`;
    endGap += 1;
    midGap -= 1;
  }

  return star;
}

function midPoint(n) {
  let star = `${'*'.repeat(n)}\n`;
  return star;
}

function bottomHalf(n) {
  let rows = Math.floor(n / 2);
  let endGap = (n - 3) / 2;
  let midGap = 0;
  let star = '';

  for (let i = 1; i <= rows; i += 1) {
    if (i === rows) {
      star += `${' '.repeat(endGap)}*${' '.repeat(midGap)}*` +
      `${' '.repeat(midGap)}*${' '.repeat(endGap)}`;
    } else {
      star += `${' '.repeat(endGap)}*${' '.repeat(midGap)}*` +
      `${' '.repeat(midGap)}*${' '.repeat(endGap)}\n`;
    }
    endGap -= 1;
    midGap += 1;
  }

  return star;
}

// console.log(
//   '*  *  *\n' +
//   ' * * * \n' +
//   '  ***  \n' +
//   '*******\n' +
//   '  ***  \n' +
//   ' * * * \n' +
//   '*  *  *'
// );

console.log(star(7));
// logs
// *  *  *
//  * * *
//   ***
// *******
//   ***
//  * * *
// *  *  *

console.log(star(9));
// logs
// *   *   *
//  *  *  *
//   * * *
//    ***
// *********
//    ***
//   * * *
//  *  *  *
// *   *   *

console.log(star(5));        // return null
console.log(star('hello'));  // return null
console.log(star(8));        // return null