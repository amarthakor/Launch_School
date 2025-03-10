// Write a function that takes two strings s and t and returns the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return an empty string.

/*
-- Problems --
INPUT: 2 arguments, both strings
output: return a string

Rules:
  - Given two stirngs, string 1 (s) and string 2 (t)
  - Return a string where
    - minimum window substring of string 1, such that every char in str 2 is included in the window
    - return a chunk of string 1 such that
      - every char in str 2, including dupes, are present in the chunk
    - if no such substring exists
      - Return an empty string
    - Order of chars does not mattter as long as all letters exist

Assumptions:
  - How should we handle empty strings for both string 1 and str 2?
    - If str 1 is empty
      - Return ''
    - If str 2 is empty
      - Return str1
- How should we proceed if str 1 and str 2 are not string args?
  - Return null
- How should we handle missing / additional args?
  - Return null for missing args
  - Ignore additional args
- Can either string contain chars besides alpha chars?
  - Yes can contain numerical / special chars as well
- How should we handle 'chunks' that have identical minimum length?
  - Choose the substring that appears first in str1

-- Examples --
- Given "ADOBECODEBANC", "ABC"
  - find the smallest chunk of str 1 that contains all chars of str 2
  - '"ADOBECODEBANC" length = 13
  - "DOBECODEBANC" 12
  - "OBECODEBANC" 11
  - "BECODEBANC" 10
  - ...
  - "BANC" length = 4
  - return "BANC"
  - Creating all chunks of the string starting from the longest to the shortest
  - Then we check to see which matches have the shortest length

  - A
  - AD
  - ADO
  - ADOB
  - ADOBE
  - ...
  - ADOBECODEBANC

  - Need to create strings from beginning to end FOR EACH LETTER

-- DS --
- need to iterate over all chars and perform a nested iteration to 
  find all combos of each letter
- can use array to iterate over word, but can also use for loops
- #slice to create a range of chars
- can also use array to check if all chars in str2 exist in str1
- may use both for loop and array

-- Algorithm --
1. Handle invalid cases
2. Create all possible 'chunks' of strings #nested iteration ** HELPER
3. Select all chunks where all chares of str2 exist in the chunk ** HELPER
4. Find the chunk of the smallest length ** HELPER
5. Return the chunk with the smallest length

helper func createAllChunks
1. Create all possible 'chunks' of strings #nested iteration
- Create a holding array to store `chunks`
  - For each character
    - Loop from the current char (single string) to the last char in str1
      - Create a #slice frmo the current char( outter loop) to the inner char
      - Push this `chunk` to the holding array
- Return the array of chunks

helper func selectValidChunjs
1. Select all chunks where all chares of str2 exist in the chunk
# Perhaps doa  filter to see which chunks are truthy and which are falsy?
  - For each char in string 2
    - If the current char is included in str1 AND their counts are the same
      - Move onto the next char
    - Else
      - Return false
  - Return true

helper func equalCount
- Iterate over string2
  - If the current char in str2 exists in
    - Remove one count of the current char in the chunk
  - Else
    - Return false
- Return true

helper func smallestChunks
1. Find the length of the smallest chunk
- Set length to Infinity
  - Iterate over valid chunks
    - If the current chunk is smaller than the current length
      - Reassign the smallestLength to the current chunks length
    - else
      - move forward
- Filter all valid chunks and select those that match smallestChunk
  - Return the first chunk
*/

function minWindow(str1, str2) {
  if (typeof str1 !== 'string' || typeof str2 !== 'string') return null;
  if (str2 === "") return str1;

  let allChunks = createAllChunks(str1);
  let validChunks = selectValidChunks(allChunks, str2)
  let smallestChunk = smallestChunks(validChunks);
  return smallestChunk ? smallestChunk : '';
}

function createAllChunks(str1) {
  let allChunks = [];
  for (let outerChar = 0; outerChar < str1.length; outerChar += 1) {
    for (let innerChar = outerChar + 1; innerChar <= str1.length; innerChar += 1) {
      allChunks.push(str1.slice(outerChar, innerChar));
    }
  }

  return allChunks;
}

function selectValidChunks(chunks, str2) {
  return chunks.filter(chunk => equalCount(chunk, str2));
}

function equalCount(str1, str2) {
  for (let idx = 0; idx < str2.length; idx += 1) {
    if (str1.includes(str2[idx])) {
      str1 = str1.replace(str2[idx], '');
    } else {
      return false;
    }
  }
  return true;
}

function smallestChunks(validChunks) {
  let smallestChunk = Infinity;
  validChunks.forEach(chunk => {
    if (chunk.length < smallestChunk) smallestChunk = chunk.length;
  });

  return validChunks.filter(chunk => chunk.length === smallestChunk)[0];
}

console.log(minWindow("ADOBECODEBANC", "ABC")); 
// Output: "BANC"

console.log(minWindow("a", "a")); 
// Output: "a"

console.log(minWindow("a", "b")); 
// Output: ""
console.log(minWindow("", "BAC")); // ""
console.log(minWindow("BAC", "")); // BAC

// Test with duplicates in target string
console.log(minWindow("ADOBECODEBANC", "AAC")); 
// Should output: "ADOBECODEBA" - we need two 'A's and one 'C'

// Test with all identical characters
console.log(minWindow("AAAAAAA", "AA")); 
// Should output: "AA"

// Test with non-alphabetic characters
console.log(minWindow("A1B2C3", "123")); 
// Should output: "1B2C3"

// Test case where first occurrence isn't the shortest
console.log(minWindow("XAYBCZAD", "ABC")); 
// Should output: "AYBC" not "AYBCZ"