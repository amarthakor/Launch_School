// Write a function that implements the Caesar Cipher. The Caesar Cipher is one of the earliest and simplest ways to encrypt plaintext so that a message can be transmitted securely. It is a substitution cipher in which each letter in a plaintext is substituted by the letter located a given number of positions away in the alphabet. For example, if the letter 'A' is right-shifted by 3 positions, it will be substituted with the letter 'D'. This shift value is often referred to as the key. The "encrypted plaintext" (ciphertext) can be decoded using this key value.

// The Caesar Cipher only encrypts letters (including both lower and upper case). Any other character is left as is. The substituted letters are in the same letter case as the original letter. If the key value for shifting exceeds the length of the alphabet, it wraps around from the beginning.


/*
------ PROBLEM -----
INPUT: string, integer value (key)
OUTPUT: string

Rules:
  - Given a `key` integer value that dictates how many chars we should shift to the right
    of the alphabet to select and replace the current letter with
  - Case of new letter must match current chars case, i.e. case matters
  - Leave nonalpha chars alone
  - If the shift value reaches past the length of the alphabet, wrap around from the beginning
    and repeat this process ( multiple times if necessary)

Assumptions:
  - What if the key is less than 0, do we shift left?
    - Assume key will always be >= 0
  - What if no key or string value is given?
    - Assume a key and string will always be provided
  - What happens if provided an empty string?
    - Return an empty string
  - What happens if a non string / non integer arg is provided?
    - first arg will always be a string, second arg will always be an integer
  - What happens if string only contains nonalpha chars?
    - Return string as is


----- EXAMPLES -----
- caesarEncrypt('A', 0) === 'A'
  - String 'A', integer value 0
    - Shift each alpha char in string by 0 places to the right
    - 'A' shfited 0 times -> 'A'
  -> return 'A'

- caesarEncrypt('A', 3) === 'D'
  - String 'A', integer value 3
    - Shift each alphachar in string by 3 places to the right
    - 'A' shifted 3 times -> 'A' -> 'B' -> 'C' -> 'D' shifted 3 times
  - Return 'D'

- caesarEncrypt('y', 5) === 'd'
  - String 'y', int val 5
    - Shift each alphachar in string 5 places to the right
    - 'y' corresponds to 'a..xyz' 'Y'/'y' is the 25th letter
    - 25 + 5 = 30, need to subtract 26 which is the length of the alphabet
    - 30 - 26 = 4, so we should then select the letter at the '4'th position
    - 'abcdefg....z', 'd' is the letter at the 4th position
  - return 'd'

- caesarEncrypt('a', 47) === 'v'
  - String 'a', invt value 47
    - 'a' corresponds to 1st position in alphabet, need to shift it 47 times == 48
    - 48 - 26 = 22, need to select the 22nd letter of the alphabet
    - 'abc...tuvwxyz' -> 'v' is the letter at the 22nd position of alphabet
  - return 'v'

- ceaserEncrypt('', 123) === ''

- ceaserEncrypt('!@#, 123) === '!@#'
  - string contains no alpha chars
  - nonalppha chars are remained unchanged
  - thus we return the given string
  - -> '!@#'

----- DATA STRUCTURES -----
- Object allows KV pairs, would be abke to link alphabetical chars to position in alphabet
  - i.e.... {a:1, b:2... z:26} {A:1, B:2... Z:26}
  - tedious to type, can introduce many errors and probably not efficient
- Arrays
  - can create two arrays:
    - one of small case letters ... ['a'...'z']
    - one of large case letters... ['A'...'Z']
  - index based 0, have to adjust from 1-26 to 0-25, but linked to a specific char
  - can iterate thru array easily if needed
  - can also select letter needed easily via bracket notation...
-> go with Arrays

----- ALGORITHM -----
- RETURN '' if string is empty
- RETURN string if string contains no alphachars

- CREATE arrays of lowercase alphabet and uppercase alphabet
  - lwrcase = ['a' ... 'z']
  - uprcase = ['A' ... 'Z']

- MODIFY the given string via rules stated above *TRANSFORMATION procedure*
  - CHECK if the current char is alphabetical letter
    - IF char is alphabetical
      - Find current chars current position, find the new position, select char at new pos (HELPER)
    - ELSE
      - return the current char

- RETURN the modified string
  - return `newString`

--------- HELPER METHOD --------
- Function to find new position and select the new letter
  - Find the index of current char
  - Add the integer shift given as second arg to `ceaserEncrypt`
  - Check if this new position is over 25 (bc index based array is 0 based)
    - IF over 25,
      - Decrement the new position by 25 until the value is <= 25 (loop or new helper method)
  - SELECT and RETURN char at index of new position

- function to decrement index values over 25
  - While the indx is greater than 25
    - decrement the idx by 25
    - stop once the idx value is equal to 25 or less
*/
const lwrcase = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
  'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
];

const uprcase = lwrcase.map(letter => letter.toUpperCase());

function caesarEncrypt(string, shift) {
  if (string === '') return string;

  string = string.split('').map(char => {
    if (/[a-z]/.test(char)) {
      return encryptLetter(char, shift);
    } else if (/[A-Z]/.test(char)) {
      return encryptLetter(char, shift);
    } else {
      return char;
    }
  });

  return string.join('');
}

function encryptLetter(char, shift) {
  let idx = char === char.toUpperCase() ? uprcase.indexOf(char) : lwrcase.indexOf(char);
  idx += shift
  idx = decrementPosition(idx);
  char = char === char.toUpperCase() ? uprcase[idx] : lwrcase[idx];
  return char;
}

function decrementPosition(idx) {
  while (idx > 25) {
    idx -= 26;
  }

  return idx;
}

// console.log(lwrcase.length, uprcase.length);
// console.log(decrementPosition(25)); // 25
// console.log(decrementPosition(24)); // 24
// console.log(decrementPosition(26)); // 1
// console.log(decrementPosition(100)); // 25

// simple shift
console.log(caesarEncrypt('A', 0) === "A");
console.log(caesarEncrypt('A', 3) === "D");

// // wrap around
console.log(caesarEncrypt('y', 5) === "d");
console.log(caesarEncrypt('aAcd', 2) === 'cCef');
console.log(caesarEncrypt('a', 47) === "v");

// // all letters
console.log(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25) === "ZABCDEFGHIJKLMNOPQRSTUVWXY");
console.log(caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5) === "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!");

// // many non-letters
console.log(caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2) === "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?");

console.log(caesarEncrypt('', 123) === '');
console.log(caesarEncrypt('!@#', 123) === '!@#');