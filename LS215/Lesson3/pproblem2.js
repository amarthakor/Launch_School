// Problem: Balanced Parentheses Subsequences
// Write a function that takes a string containing only parentheses '(' and ')' as input. The function should return the length of the longest balanced parentheses subsequence in the string. A balanced parentheses subsequence is one where every opening parenthesis '(' has a corresponding closing parenthesis ')' in the correct order, and they are properly nested.
// Note: A subsequence doesn't need to be contiguous. You can skip characters in the original string, but the order of characters in the subsequence must be the same as in the original string.
// Here are a few test cases to get you started:

/*
--- PROBLEM
INPUT: string
OUTPUT: integer

Rules:
  - Need to find length of longest `balanced parantheses substring`
  - `BPS` is a substring that starts with a '(' and ends w corresponding ')'
    - must be properly nested
  - Doesn't need to be contiguous -- what does this mean?
  - Don't need to start at beginning of string, but order of chars in substring must be same as original str

Rules:
  - How should we handle an empty string?
    - Return 0
  - What if multiple args are provided?
    - Ignore additional arguments
  - What if the arg is a non string data type?
    - Return null
  - Can the string contain other chars besides ()?
    - No, the string will always consist of either ( or )
  - What if we are missing an opening or closing parantheses?
    - Return 0

--- EXAMPLES
(longestBalancedSubsequence("(())")); // Output: 4
  - Given string is '(())', return is 4
    - All matches of balanced ()
      - '(xx)' -> length is 4
      - 'x()x' -> length is 2
    -> Return longest of the substrings
    -> 4

(longestBalancedSubsequence("()())")); // Output: 4
  - Given str is '()());, return is 4
    - All matches of balanced ():
      - '()xxx' -> length is 2
      - 'xx()x' -> length is 2
      - '()()x; -> length is 4
    -> Return longest subs
    -> 4

(longestBalancedSubsequence(")()())")); // Output: 4
  - Given string is ')()())', return is 4
    - All matches of balanced ():
      - 'x()xxx' -> length is 2
      - 'xxx()x' -> length is 2
      - 'x()()x' -> length is 4
      -> Return longetst substr
    -> 4

(longestBalancedSubsequence("((())")); // Output: 4
  - Given string is '((())', return is 4
    - All matches of balanced ():
      - 'xx()x' -> length is 2
      - 'xx()x' -> length is 2
      - 'x(())' -> length is 4
      - Return longest substr value
    -> 4

(longestBalancedSubsequence("())(()")); // Output: 4
  - Given string is '())(()', return is 4
    - All matches of balanced ():
      - '()xxxx' -> length of 2
      - 'xxxx()' -> length of 2
      - '()xx()' -> length of 4
      - ()
      - Return longest length substr
    -> 4

(longestBalancedSubsequence(")(")); // Output: 0
  - Given string is ')(', return is 0
    -> There are no possible balanced matches
    -> Return 0;

(longestBalancedSubsequence("")); // 0

(longestBalancedSubsequence("((("); // 0
(longestBalancedSubsequence(")))")); // 0

(longestBalancedSubsequence(['h', 'e', 'll', 'o', 'world])); // null

(longestBalancedSubsequence("(())", "(())")); // 4
--- DATASTRUCTURES
- Array would all us to iterate over chars and perform abstractions more easily
  - may need to iterate and create all possible substrings

--- ALGORITHM
1. Return 0 for valid conditions
2. Return null for invalid conditions
3. Count all the valid pairs of ()
  - If the current char is '('
    - Increment the counter by +1
  - If the current chair is ')' and the counter is > 1
    - Increment validPairs by +1
    - Decrement the counter by -1
4. Multiple the count by 2
5. Return the count
*/

function longestBalancedSubsequence(string) {
  if (typeof string !== 'string') return null;
  let openPar = 0;
  let validPairs = 0;

  for (let idx = 0; idx < string.length; idx += 1) {
    if (string[idx] === '(') openPar += 1;
    if (string[idx] === ')') {
      if (openPar > 0) {
        openPar -= 1;
        validPairs += 1;
      }
    }
    // console.log(openPar, validPairs);
  }

  return validPairs * 2;
}

console.log(longestBalancedSubsequence("(())")); // Output: 4
console.log(longestBalancedSubsequence("()())")); // Output: 4
console.log(longestBalancedSubsequence(")()())")); // Output: 4
console.log(longestBalancedSubsequence("((())")); // Output: 4
console.log(longestBalancedSubsequence("())(()")); // Output: 4
console.log(longestBalancedSubsequence(")(")); // Output: 0
console.log((longestBalancedSubsequence(""))); // 0
console.log((longestBalancedSubsequence("((("))); // 0
console.log((longestBalancedSubsequence(")))"))); // 0
console.log((longestBalancedSubsequence(['h', 'e', 'll', 'o', 'world']))); // null
console.log((longestBalancedSubsequence("(())", "(())"))); // 4
console.log(longestBalancedSubsequence("((())()()))")); // Should output: 10
console.log(longestBalancedSubsequence("())(())((()")); // Should output: 8
console.log(longestBalancedSubsequence(")(()((()))()")); // Should output: 10
console.log(longestBalancedSubsequence("(()(()))(())")); // Should output: 12
console.log(longestBalancedSubsequence("((()())))")); // Should output: 8
