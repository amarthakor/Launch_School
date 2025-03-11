// Write a function that takes an array of strings and groups anagrams together. Two strings are anagrams if they contain the same characters (ignoring case and spaces). Return the answer in any order.

/*
-- Problem --
INPUT: one dimensional array
OUTPUT: minimum 2d array

Rules:
  - Given an array of strings - "words"
  - Return all anagrams in a group "subarray" together
    - Anagrams are words that contain the same characters
      - ignore case
      - ignore spaces
  - Return groups can be in any order

Assumptions:
- We ignore spaces, does this mean if we are given a string such as "hello world",
  it is the same as "helloworld" or "wellohorld" as far as anagrams go?
    - Yes, all spaces WITHIN a word should be ignored
- How do we handle non array arguments?
  - Return null
- Can our array argument contain non string elements?
  - No, arrasy will alwaus contain string elements only
- How snould we handle additional arguments?
  - Ignore additional arguments
- How should we handle strings only contains whitespace?
  - You will not have any strings containing only whitespace


-- Examples --
- Given ["eat", "tea", "tan", "ate", "nat", "bat"]
  - return all words in a group of anagrams
  - eat, tea, ate
  - tan, nat
  - bat
  -> [[eat, tea, ate], [tan. nat], [bat]]

-- DAta Structures --
- given an array, return a 2D array
- use array sort method to see if 2 words are the same "anagram"

-- Algorithm --
1. Handle any null or edge cases
2. Find all unique sorted anagrams from the given array of strings #account for space and case
3. Filter / Separate given words into groups based on their unique sorted anagram match
4. Return this group of filtered anagram groups (subarrays)


Helper func find unique words
1. Find all unique sorted anagrams from the given array of strings #account for space and case
  - Create an empty holding array 
  - For each word in the given array
    - sort the chars into alphabetical order (downcase and remove any whitespace in the word)
    - if the sorted modified word exist in the holding aray
      - move onto the next word
    - if it doesnt exist in the holding array
      - add the sorted modified word to the holding array
  - Return the array of uniq sorted words


3. Filter / Separate given words into groups based on their unique sorted anagram match
- Create a holding array to hold all anagram groups
- For each unique sorted word
  - Filter all words in the given array that are the same as the current unique word
    - If there is a match
      - Push these matches into the holding array
    - Else
      - Move onto the next unique word
- Return the array of groups
*/

function groupAnagrams(words) {
  if (!Array.isArray(words)) return null;

  let uniqWords = findUniqWords(words);
  return filterWords(uniqWords, words);
}

function findUniqWords(words) {
  let uniqWords = [];

  words.forEach(word => {
    let alteredWord = word.replace(/[\s]/g, '').toLowerCase();
    alteredWord = alteredWord.split('').sort().join('');
    if (!uniqWords.includes(alteredWord)) uniqWords.push(alteredWord);
  });

  return uniqWords;
}

function filterWords(uniqWords, words) {
  let groupedWords = [];
  uniqWords.forEach(sortedWord => {
    let allMatches = words.filter(word => {
      return sortedWord === word.toLowerCase().split('').sort().join('').replace(/[\s]/g, '');
    });
    if (allMatches.length > 0) groupedWords.push(allMatches);
  });

  return groupedWords;
}

console.log(groupAnagrams(123)); // null

console.log(groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]));
// Output: [["eat","tea","ate"],["tan","nat"],["bat"]]

console.log(groupAnagrams([""])); 
// Output: [[""]]

console.log(groupAnagrams(["a"])); 
// Output: [["a"]]

// 32:54 MINUTES TO SOLVE PROBLEM

// Test case with uppercase and lowercase variations
console.log(groupAnagrams(["Eat", "Tea", "EAT", "ate"]));
// Expected: [["Eat", "Tea", "EAT", "ate"]]

// Test case with spaces
console.log(groupAnagrams(["he llo", "hel lo", "hello"]));
// Expected: [["he llo", "hel lo", "hello"]]

// // Test case with mixed case and spaces
console.log(groupAnagrams(["A gentleman", "Elegant man", "a GENTLEMAN"]));
// // Expected: [["A gentleman", "Elegant man", "a GENTLEMAN"]]

// Test case with empty array
console.log(groupAnagrams([]));
// Expected: []

// Test case with special characters
console.log(groupAnagrams(["rat!", "tar!", "!art"]));
// Expected: [["rat!", "tar!", "!art"]]

// Test case with numbers as strings
console.log(groupAnagrams(["123", "321", "213"]));
// Expected: [["123", "321", "213"]]

// Test case with all different words (no anagrams)
console.log(groupAnagrams(["apple", "banana", "cherry"]));
// Expected: [["apple"], ["banana"], ["cherry"]]

// # Test cases
console.log(groupAnagrams(['demo', 'dome', 'mode', 'live', 'evil', 'veil', 'fowl', 'wolf'])); 
// # => [["demo", "dome", "mode"], ["live", "evil", "veil"], ["fowl", "wolf"]]

console.log(groupAnagrams(['listen', 'silent', 'enlist', 'hello']));
// # => [["listen", "silent", "enlist"], ["hello"]]