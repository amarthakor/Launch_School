/*
You're given an array, chars, of lowercase English letters sorted in ascending order, and a lowercase letter, key. Your task is to find the smallest letter in chars that is lexicographically greater than key. If no such letter exists, return the first letter in chars.

--- Problem
INPUT: an array of sorted lowercase alphabetical chars in asc order, a `key` char
OUTPUT: letter /char

  Rules:
    Return a letter where:
    - find smallest letter in array given that is lexicographically
      greater than the `key`
    - If no such letter exists, return the first letter in chars
    - What does lexicographically means?
      - ASCII value of char
      - can compare char > char to determine this 
    - What does smallest mean in this context?
      - smallest ASCII value that is > than the key value

Assumptions:
- What if provided an empty array?
  - Return null
- Will first arg always be an array?
  - Return null if not array
- Will all elements always be lowercase single char english alpha chars?
  - yes
- What if second arg is non lowercase alpha char?
  - will always be a lowercase alpha single char
- What about additional args, missing args?
  - Ignore additional args, always precisely 2 arguments

--- Examples
Given: ['b', 'd', 'f'], 'a'), return -> 'b'
  - b > a true
  - d > a true
  - f > a true
  - f > d > b
  -> return 'b'

Given: ['a', 'c', 'f', 'h', 'i', 'j'], 'g' -> return 'h'
  - a > g false
  - c > g false
  - f > g false
  - h > g trie
  - i > g true
  - j > g true
  - j > i > h
  -> 'h'

  # check midpoint -> 'f'
  - 'f' is < 'g' so we can elimiate f and the left side
  - [h i j]
  - check new midpoint -> i
  - i is > g so we can elimate the right side
  - [h, i]
  - check

--- DS
- Could iterate thru given array but time compex is O(N)
- Can use while loop to binary search and reduce time complex to O(logN)

--- Algorithm
1. Handle edge cases
2. set left to 0, right to arr size - 1
3. set smallestKey = arr[0];
4. Find the smallest letter that is > than the key # binary search
- While left <= right
  - Set mid = left + right / 2 .floor
  - If (arr[mid] is > key)
    - smallestKey = arr[mid]
    - right = mid - 1
  - else
    left = mid + 1

5. return smallestKey
*/

// ['a', 'c', 'f', 'h', 'i', 'j'], 'g'

function findNextLetter(letters, key) {
  if (!Array.isArray(letters) || letters.length === 0) return null;
  let [left, right, smallestKey] = [0, letters.length - 1, letters[0]];

  while (left <= right) {
    // console.log(smallestKey, `left:` + left, `right:` + right);
    let mid = Math.floor((left + right) / 2);
    if (letters[mid] > key) {
      smallestKey = letters[mid];
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }

  return smallestKey;
}
// 

// Example test cases:
console.log(findNextLetter(['b', 'd', 'f'], 'a') === 'b');
console.log(findNextLetter(['b', 'd', 'f'], 'c') === 'd');
console.log(findNextLetter(['b', 'd', 'f'], 'f') === 'b');
console.log(findNextLetter(['a', 'a', 'b', 'c'], 'a') === 'b');
console.log(findNextLetter(['c', 'f', 'j'], 'c') === 'f');
console.log(findNextLetter(['a', 'c', 'f', 'h', 'i', 'j'], 'g') === 'h');
console.log(findNextLetter(123, 'a') === null);
console.log(findNextLetter([], 'a') === null);
// All test cases should log true.
