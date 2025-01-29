// A collection of spelling blocks has two letters per block, as shown in this list:


// B:O   X:K   D:Q   C:P   N:A
// G:T   R:E   F:S   J:W   H:U
// V:I   L:Y   Z:M
// This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

// Write a function that takes a word string as an argument and returns true if the word can be spelled using the set of blocks, false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

/*
----- PROBLEM -----
INPUT: string
OUTPUT: boolean true or false

Rules:
  - Given a string, return true based on if the word can be spelled using the blocks where
    1. only 1 letter from the block pair can be used
    2. case does not apply
    3. eack pair of blocks can only be used once
    4. this implicitly means that the longest string we can have is 13 chars long
      since there are 13 blocks, one letter from each block

Assumptions:
  - Will the given string contain only alpha chars?
    - Return null if the string has nonalpha chars
  - What happens if passed an empty string?
    - Return null
  - What happens if string that is longer than 13chars is passed?
    - return false
  - What happens if a non string arg is passed?
    - return null

----- EXAMPLES -----
isBlockWord('BATCH');      // true
  - 5 char word `BATCH` -> true
    - B is paired with O
    - A is paired with N
    - T is paired with G
    - C is paired with P
    - H is paired with U
  - Since each letter is used once and each block is only used once, true is returned

isBlockWord('BUTCH');      // false
  - 5 char word `BUTCH` -> false, thus we have a block repeated more than 1x or or 2 letters frmo same block used
    - B is paired with O
    - U is paired with H <----
    - T is paired with G
    - C is paired with P
    - H is paired with U <----

  - since H and U are used which are from the same block, we return false


----- DATA STRUCTURES -----
- Object would allow easy way tos tore block pairs
- Meanwhile, array would allow easy method to check which block-pairs we've used


----- ALGORITHM -----
- Return null or false if invalid argument is passed
  - Check if arg is > 13 chars, contains non alpha chars, or is not a string arg

- CREATE constant obj w/ all 13 pairs of letters
- Add pair of letters into array for each letter in the given argument
  - Declare empty array `letters`
  - Iterate over string
  - For each character in string
    - Check the array to see if it includes the key (letter1) or value (letter2)
      - If so
        - return false
    - If not
      - Add the letters to the array and mvoe onto the next character in the str argument
- Return true
*/

const PAIRS = {
  'B': 'O', 'X': 'K', 'D': 'Q', 'C': 'P', 'N': 'A',
  'G': 'T', 'R': 'E', 'F': 'S', 'J': 'W', 'H': 'U',
  'V': 'I', 'L': 'Y', 'Z': 'M',
};

function isBlockWord(word) {
  if (/[^a-z]/ig.test(word) || typeof word !== 'string' || word === '') return null;
  if (word.length > 13) return false;
  word = word.toUpperCase();
  let letters = [];

  for (let idx = 0; idx < word.length; idx += 1) {
    for (let key in PAIRS) {
      if (key === word[idx] || PAIRS[key] === word[idx]) {
        if (letters.includes(key)) return false;
        letters.push(key, PAIRS[key]);
      }
    }
  }

  return true;
}


console.log(isBlockWord('BATCH'));          // true
console.log(isBlockWord('jest'));           // true
console.log(isBlockWord('BGVXRLDFZCJNH'));  // true
console.log(isBlockWord('BUTCH'));          // false
console.log(isBlockWord('BGVXRLDFZCJNHA')); // false
console.log(isBlockWord('B@TCH'));          // null
console.log(isBlockWord(1));                // null
console.log(isBlockWord(''));               // null