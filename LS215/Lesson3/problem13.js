// Implement a function that performs basic string compression using the counts of repeated characters. For example, the string "aabcccccaaa" would become "a2b1c5a3". If the "compressed" string would not become smaller than the original string, your function should return the original string.

// javascript
/*
INPUT: string
OUTPUT: return a string

Rules:
  - Given a string, transform it such that:
    - 'compress' repeated characters, followed by their repeat amount
      'compress' means reduce all repeated chars into one copy
  - If the transformed string is not smaller than the original string
    - Return the original string
  - If a string does not have any repeats, it will be the same exact length
    as the transformed string, thus we return the original string

Assumptions:
  - Can the string contain any type of char besides nonalpha chars?
    - Yes, it can
  - Should whitespace be compressed as well?
    - Yes they should into 1 char. i.e. ' 3' === '   '
  - How should we handle empty strings
    - Return an empty string
  - What about additional args?
    - There will always be preceisely one argument only
  - How to handle non string args?
    - Return null

-----
compressString("aabcccccaaa")); // "a2b1c5a3"
  - Given 'aabcccccaaa'
    -> compress repeats into single char followed by repeat count
    -> a2, b1, c5, a3
    -> 'aabcccccaaa'.length > 'a2b1c5a3'.length
  -> 'a2b1c5a3'

compressString("abcdef")); // "abcdef"
  -> Given 'abcdef'
    -> compress any repeated chars
    -> a1 b1 c1 d1 e1 f1
    -> 'abcdef'.length < 'a1b1c1d1e1f1'.length
  -> 'abcdef'

compressString('   '); // ' 2'
compressString('  '); // '  ' ?
  -> given '  '
    -> ' 2'
    -> '  '.length === ' 2'.length
    - bc compressed is not greater than original; return original
  -> '  ';
compressString(''); // ''
compressString('111222333aaa!!!); // '132333a3!3'
compressString(1); // null

  ** 9 minutes AND THIRTY SECONDS AT THIS MOMENT **
 
-----
- can use an array to identify all unique chars and counts in order

-----
1. Handle invalid conditions
2. Create an array to store subarrays of chars and their counts
3. Find the count of each char in order of its palce in the string
  - For each char
  - if the current char is equal to the prev char
    - Increment a counter by 1
  - If the current char is !== to the prev char
    - Increment the uniqChar string by the counter
    - Increment the uniqChar string by the new different char

5. If the new string length is shorter than the OG string length
  - Return the new String, otherwise return the OG string length
*/

function compressString(string) {
  if (typeof string !== 'string') return null;

  let compressedStr = findUniqCharCount(string);

  return compressedStr.length < string.length ? compressedStr : string;
}

function findUniqCharCount(string) {
  let uniqCharCount = string.slice(0, 1);
  let counter = 1;
  for (let idx = 1; idx < string.length; idx += 1) {
    if (string[idx] === string[idx - 1]) {
      counter += 1;
    } else {
      uniqCharCount += String(counter);
      uniqCharCount += string[idx];
      counter = 1;
    }
    if (idx === string.length - 1) uniqCharCount += String(counter);
    console.log(uniqCharCount, idx, counter);
  }

  return uniqCharCount;
}

console.log(compressString("aabcccccaaa")); // "a2b1c5a3"
console.log(compressString("abcdef")); // "abcdef"
console.log(compressString('') === ''); // ''
console.log(compressString('  ') === '  '); // '  '
console.log(compressString('   ') === ' 3'); // ' 3'
console.log(compressString('111222333aaa!!!')); // '132333a3!3'
console.log(compressString(1)); // null

console.log(compressString("AABBBCCCC")); // "A2B3C4"
console.log(compressString("a")); // "a"
console.log(compressString("aa")); // "aa"
console.log(compressString("aaa")); // "a3"
console.log(compressString("aaabbbcccdddeee")); // "a3b3c3d3e3"
console.log(compressString("aaAAbbBB")); // "aaAAbbBB"
console.log(compressString("  a  b  c  ")); // "  a  b  c  "
console.log(compressString("abcdefghijklmnopqrstuvwxyz")); // "abcdefghijklmnopqrstuvwxyz"