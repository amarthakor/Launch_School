// You're keeping score for a futuristic game called "Nexus Surge."
// In this game, players accumulate points in unusual ways. At the
// start of each round, you begin with an empty scoreboard.

// You receive a sequence of scoring actions as an array of strings.
// Each action in the sequence is one of the following:

//  -  An integer x:
//      - Add a new score of x points to the scoreboard.
//  - '+':
//      - Add a new score that is the sum of the two most recent scores.
//  - '*':
//      - Add a new score that is double the most recent score.
//  - '-':
//      - Remove the most recent score from the scoreboard.

// Create a function `nexusSurge` that calculates and returns the sum
//  of all scores on the scoreboard after applying all the given actions.

// The input will be an array of valid operations.

// For operation "+", there will always be at least two previous scores on the record.
// For operations "*" and "-", there will always be at least one previous score on the record.

/*
--- Problem
INPUT: array of strings
OUTPUT: sum of all scores on the scoreboard

Rules:
- keeping track of points
  - need something to track points
- each round i begin w/ an empty scoreboard
- receive scoring 'actions' as an array of strings
- actions consist of ->
  - an integer which is added to the scoreboard and represents poitns
  - '+' which adds the two most recent scores and puts it into the scoreboard
  - '*' adds a new score to the scoreboard where we double the most recent score
  - '-' remove the most recent score from the scoreboard
- 4 total actions

  - for '+' operations, will always hace at least two previous scores
    - dont need to worry baout not having enough scores to add
  - for '*' and '-', there will always be at least one prev score in order
    to perform the new operation and add the new score

Assumptions:
- Will we always be given an array arg?
  - Yes
- Will our array elements always ocnsist of only string ints and '-', '*', '+'
  - Yes
- Is the string element '504' one score, 504, or three scores '5', '0', and '4'? 
  or some other comibination such as '50', '504', and '04?
  - Each string score element represents an integer, they are not digits; thus
  '504' is 504 points, not some other combo of points composed of '5' '0' and '4'
- Will we ever receive additional args?
   - No
- How should we handle an empty array?
  - Return 0
- Can scores be positive, negative, and 0?
  - Yes, any combination of these three integer types
- Will scores ever be any non integer valyes?
  - No

--- Examples
- Given ["3", "4", "+"]) return -> 14 integer
  - score points = []
  - '3' -> [3]
  - '4' -> [3, 4]
  - '+' -> add prev two scores 3 + 4 -> 7 -> [3, 4, 7]
  - [3, 4, 7] all scores, sum is 14
  -> 14

- Given actions ["7","3","-","*","+"] -> return 42
  - scores = []
  - '7' -> [7]
  - '3' -> [7, 3]
  - '-' -> remove most recent score (3) -> [7]
  - '*' -> double most recent score (7 * 2) -> 14 -> [7, 14]
  - '+' -> add 2 most recent scores (7 + 14) -> 21 [7, 14, 21]
  - scores = [7, 14, 21] -> 21 + 21 = 42
  -> 42

- Given actions ["6", "-", "-8", "*", "2", "+"]) return -> -36
  - scores = []
  - 6 -> [6]
  - '-' -> []
  - -8 -> [-8]
  - '*' -> [-8, -16]
  - 2 -> [-8, -16, 2]
  - '+' -> add sum of 2 most recent scores -> -14 [-8, -16, 2, -14]
  - scores = [-8, -16, 2, -14] -> -24 + 2 -> -22 + -14 = -36
  -> -36

*/

// Example 1:

// Input: actions = ["7","3","-","*","+"]
// Output: 42
// Explanation:
// "7" - Add 7 to the scoreboard, scoreboard is now [7].
// "3" - Add 3 to the scoreboard, scoreboard is now [7, 3].
// "-" - Remove the previous score, scoreboard is now [7].
// "*" - Add 2 * 7 = 14 to the scoreboard, scoreboard is now [7, 14].
// "+" - Add 7 + 14 = 21 to the scoreboard, scoreboard is now [7, 14, 21].
// The total sum is 7 + 14 + 21 = 42.

// Example 2:

// Input: actions = ["8","-3","6","-","*","12","+","+"]
// Output: 35
// Explanation:
// "8" - Add 8 to the scoreboard, scoreboard is now [8].
// "-3" - Add -3 to the scoreboard, scoreboard is now [8, -3].
// "6" - Add 6 to the scoreboard, scoreboard is now [8, -3, 6].
// "-" - Remove the previous score, scoreboard is now [8, -3].
// "*" - Add 2 * -3 = -6 to the scoreboard, scoreboard is now [8, -3, -6].
// "12" - Add 12 to the scoreboard, scoreboard is now [8, -3, -6, 12].
// "+" - Add -6 + 12 = 6 to the scoreboard, scoreboard is now [8, -3, -6, 12, 6].
// "+" - Add 12 + 6 = 18 to the scoreboard, scoreboard is now [8, -3, -6, 12, 6, 18].
// The total sum is 8 + (-3) + (-6) + 12 + 6 + 18 = 35.

// Example 3:

// Input: actions = ["4","-"]
// Output: 0
// Explanation:
// "4" - Add 4 to the scoreboard, scoreboard is now [4].
// "-" - Remove the previous score, scoreboard is now [].
// Since the scoreboard is empty, the total sum is 0.

/*
--- DS
- given an array arg that represents actions and scores
- need to track all my scores + the scores I remove / add
- actions are being performed on the previous 1-2 scores
- stack would be last in first out LIFO
- queue would be first in first out FIFO
- dont want queue bc need to access prev elements depending on where i am in my 
  scoreboard
- stack would be ideal
- iterate over my given actions -> O(N)
  - N = size of input array
- iterate over scores to get a total sum -> O(M)
  - M represents all scores for a game of nexus Surge
- time complexity would be ideally O(N+M) with two iterations over my input / scores (stack)

--- Algorithm
1. Create a stack for my scores
2. Add scores to my stack
- while the length of the input is greater than 0
  - remove the first element from the input and assign it 'action'
  - if the action converted to a number is a valid number
    - push the number to the stack
  - else if the action is '+'
    - add the two most recent numbers in the stack and push it to the stack
  - else if the action is '*'
    - 2x the most recent number in the stack and push it to the stack
  - else the action is '-'
    - remove the last number in the stack
3. Set totalScore to 0
4. Sum all scores in my stack and assign it to totalScore
  - for each score in the stack
    - increment totalScore by the current score from the stack
5. Return totalScore
*/

function nexusSurge(actions) {
  if (actions.length === 0) return 0;
  let stack = [];

  for (let i = 0; i < actions.length; i++) {
    let action = actions[i];
    if (!isNaN(Number(action))) {
      stack.push(Number(action));
    } else if (action === '+') {
      stack.push(((stack[stack.length - 1]) + (stack[stack.length - 2])));
    } else if (action === '*') {
      stack.push((stack[stack.length - 1]) * 2);
    } else {
      stack.pop();
    }
  }

  let totalScore = 0;
  for (let score of stack) {
    totalScore += score;
  }

  return totalScore;
}

console.log(nexusSurge([]) === 0);
console.log(nexusSurge(["3", "4", "+"]) === 14);
console.log(nexusSurge(['0', "3", "4", "+"]) === 14);
console.log(nexusSurge(["5", "-", "-2"])=== -2);
console.log(nexusSurge(["1", "-", "-3", "*"]) === -9);
console.log(nexusSurge(["5", "-2", "+", "-", "7", "*"]) === 24);
console.log(nexusSurge(["-3", "-", "4", "8", "+", "*"]) === 48);
console.log(nexusSurge(["1", "-2", "3", "-", "+", "-"]) === -1);
console.log(nexusSurge(["-10", "*", "-", "5", "+", "7"]) === -3);
console.log(nexusSurge(["6", "-", "-8", "*", "2", "+"]) === -36);
console.log(nexusSurge(["1", "-", "2", "*", "+", "-10", "-", "*"]) === 24);
// All test cases should log true.