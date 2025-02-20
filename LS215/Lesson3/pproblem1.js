// Problem: Substring Frequency Counter
// Write a function that takes two strings as arguments: a word and a string of text. The function should return the number of times the word appears as a substring in the text, but with a twist: it should count overlapping occurrences as well.

/*
----- PROBLEM
INPUT: 2 args, word (string) and a string of text
OUTPUT: integer

Rules:
  - integer represents number of times word appears as a substring
    - including overlapping occurrences
  - What does oberlapping mean in this context?

Assumptions:
  - What if the first or second arg is an empty string?
    - Return 0 if either are empty strings
  - Will either argument ever be a non string argument?
    - Return null if either argument is not a string
  - Will the given args always be lowercase, or will we have uppercase as well?
    - Assume you may be provided lower or uppercase, function should be able to handle both
  - Should we match case insenitively? does 'a' match with 'A'?
    - Case matters, only match words & substrings that are same case same chars
  - What if an argument is missing?
    - Return null if only one argument is provided
  - What if multiple args are passed?
    - Ignore all args past the first two


----- EXAMPLES
substringFrequency('aa', 'aaaa'));                                         3
  - Given word 'aa', text is 'aaaa', return is 3
    - Starting at 0 index 'aa' matches 'aa'             1
    - Move to next char, 'aa' index [1-2] mathches 'aa'   2
    - Move to next char, 'aa' index [2-3] matches 'aa'   3
    - Move to final char 'a' index [3] does not match 'aa'
    -> return 3

substringFrequency('abc', 'abcabcabc'));                                   3
  - Given word 'abc', text 'abcabcabc', return is 3
    - Start at index 0, 'a' upto 3 letters = 'abc'
      - matches given word 'abc' + 1
    - Move to index 1, 'b' upto 3 letters = 'bca'
      - not matches given word
    - Move to index 2, 'c' upto 3 letters = 'cab'
      - doesn't amtch given word
    - Move to index 3, 'a', upto 3 letters = 'abc'
      - does match given word + 1 (total 2)
    ...
    - Move to index 6, 'a', upto 3 letters = 'abc'
      - does match given word + 1 (total 3)
    - Indexes 7, 8 fail
    -> return 3

substringFrequency('x', 'hello world'));                                   0
  - Given word 'x', text 'hello word', return is 0
    - Check to see if given text contains given word
    - 'hello world' contains no 'x's
    - return 0

(substringFrequency('x')); // return null
  - given one arg, 'x', missing second arg, return is null
    - return Null since arg is missing

(substringFrequency('x', 'xxx', 'xxxx')); // return 3?
  - Given word 'x', text 'xxx', third arg 'xxxx' which is ignored, return 3?
    - Start at index 0, 'x' upto 1 letter  = 'x'
      - Matches word so +1 total
    - Move to idx 1, 'x' upto 1 letter = 'x'
      - matches word 'x' so +1 total again
    ...
    return 3

(substringFrequency('', '')); // return 0
  - Return 0 if either arg given is an empty string

(substringFrequency(1, 's')); // null
  - Return null if either 1st or 2nd arg is not a string arg

(substringFrequency('1', [])); // null
  - Return null if either 1st or 2nd arg is not a string arg

(substringFrequency('a', 'aAa')); // 2
  - Start at idx0, upto 1 char = 'a'
    - Matches given word 'a', +1 total
  - Move to idx1, upto 1 char = 'A'
    - Doesnt match given word 'a', move to next
  - Move to dix 2, upto 1 char 'a'
    - Matches given word, +1 total
  -> return 2

(substringFrequency('A', 'aaAA')); // 2
  - Starting at idx0 upto 1 char = 'a'
    - Doesnt match given word 'A', move to enxt
  - Move to idx1 upto 1 char = 'a'
    - Doesnt match given word 'A', move ot next
  - Move to idx2 upto 1 char = 'A'
    - Matches given word 'A', +1 total move to next
  - Move to idx3 select upto 1char = 'A'
    - Matches given word 'A', +1 total
  -> return 2
----- DATA STRUCTURES
- array would allow easy iteratiopnm over each letter
- can also use ForLoop and slice to create substrings without needing
  to split string into an array of chars

----- ALGORITHM
1. Return null if invalid conditions are met
  - If arg2 is undefined return null
  - if arg1 || arg 2 are not strings, return null

2. Return 0 if either arg is empty OR text does not contain given word
  - check IF arg1 || arg2 === ''
  - check if arg2 does not include arg1 #includes
    - return 0 if either the above are true

3. initalize `matches` to 0

4. Count how many times the given word appears as a substr in the text
  - Loop through arg2
  - For each character in arg2
    - Check if the current char upto the next `x` chars that match arg1s length are === to arg1
      - Ex) arg1 = 'abc', length = 3 so find a substr of the current char upto 3 chars long and 
            - see if it matches the given word
      - increment matches by 1 if it does match

5. Return the value of `matches`

*/

function substringFrequency(word, text) {
  if (typeof text !== 'string' || typeof word !== 'string') return null;
  if (word === '' || text === '' || !text.includes(word)) return 0;
  let matches = 0;

  for (let idx = 0; idx < text.length; idx += 1) {
    if (text.slice(idx, idx + word.length) === word) matches += 1;
  }

  return matches;
}
console.log(substringFrequency('aa', 'aaaa') === 3);          // Output: 3
console.log(substringFrequency('abc', 'abcabcabc') === 3);    // Output: 3

console.log(substringFrequency('x', 'hello world') === 0);    // Output: 0
console.log(substringFrequency('x') === null);                 // return null

console.log((substringFrequency('x', 'xxx', 'xxxx')) === 3);  // return 3?

console.log(substringFrequency('', '') === 0);              // return 0
console.log(substringFrequency(1, 's') === null);              // null
console.log(substringFrequency('1', []) === null);             // null

console.log((substringFrequency('a', 'aAa')) === 2);          // 2
console.log((substringFrequency('A', 'aaAA')) === 2);         // 2
console.log((substringFrequency('aA', 'aAbcaABAAaAaa')) === 3); // 3
console.log((substringFrequency('AA', 'aAAAaAaaAA')) === 3); // 3