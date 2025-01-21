// Write a function that returns the position of the closest active opponent. If two opponents are equidistant, return the opponent with the higher position on the board.


/*
----- PROBLEM -----
INPUT: Object and an integer
OUTPUT: Integer

RULES:
- Integer argument represents the current position
- Need to select the position from the given object that is closest to the integer arg
  - `closest` means smallest difference between given position and opponenet position
- If two opponents are equidistant in difference, select the larger opponent

- Assumptions
  - What if two + integer arguments are given?
    - Ignore any additional arguments that are integers

  - What if multiple object args are provided?
    - Ignore any additional arg that are objects

  - What if the given object is empty?
    - Return null

  - What if no integer starting position is provided?
    - Return null

  - What if object is provided with no positions or an opponent w a position not
    represented by an integer?
    - Return the closest active opponent
    - IF there are no possible active opponents
      - return null

  - What if a non object / integer argument are provided?
    - Assume only object / integer argument will be provided

  - How should we treat negative opponent positions?
    - Assume negative positions will not be included

  - What if all opponent positions are the same?
    - Return the first opponent

----- EXAMPLES -----
console.log(findClosestOpponent({
  "Opponent 1" : 1,
  "Opponent 2" : 15,
  "Opponent 3" : 37
}, 10)); // 15
- Starting position is 10, closest opponent is 15, thus we return 15

console.log(findClosestOpponent({
  "Opponent 1a" : 1,
  "Opponent 1b" : 5
}, 3)); // 5
- starting position is 3
- 5 - 1 = 4, 5 - 3 = 2, closest active opponent is 5 thus return 5

console.log(findClosestOpponent({
  "Opponent 1a" : 1, "Opponent 1b" : 5,
  "Opponent 1c" : 50, "Opponent 1d" : 100, "Opponent 1e" : null
}, 150)); // 100

- starting position is 150
- 150 - 1 = 149, 150 - 5 = 145, 150 - 50 = 100, 150 - 100 = 50, 150 - null = NaN
- Smallest difference is 50 from 100, thus return 100
  - How to handle non integer numbers such as null?


----- DATA STRUCTURE -----
- Use Array to store all active positions
- also use secondary array to store equidistant positions and select max value

----- ALGORITHM -----
- Return null if object is empty
- Declare var `activePositions` and set toe mpty array
- Declare var `smallestDiff` but dont initialize
- Iterate over object
  - For each KV pair,
  - If the value is a number
    - Push it to `activePositions`
- Iterate over `activePos` array
  - If idx is 0
    - Set `smallestDiff` to difference of given absolute val |int - current ele|
  - Otherwise, find the diff between given val and current ele
    - If the difference is smaller than `smallestDiff` current value
      - Reassign `smallestDiff` to this new smallest difference
- Filter `activePositions` to elements that are equal to given diff - element == smallestDiff
  - Sort this returned array and return the last element
*/


function findClosestOpponent(positions, position) {
  // ...
}

console.log(findClosestOpponent({
  "Opponent 1" : 1,
  "Opponent 2" : 15,
  "Opponent 3" : 37
}, 10)); // 15

console.log(findClosestOpponent({
  "Opponent 1a" : 1,
  "Opponent 1b" : 5
}, 3)); // 5

console.log(findClosestOpponent({
  "Opponent 1a" : 1, "Opponent 1b" : 5,
  "Opponent 1c" : 50, "Opponent 1d" : 100, "Opponent 1e" : null
}, 150)); // 100