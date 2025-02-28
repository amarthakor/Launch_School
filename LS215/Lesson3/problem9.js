// 1.  Anagram Grouping
// Write a function that takes an array of strings as input and returns an array of arrays, where each sub-array contains all the anagrams grouped together.

/*
---- PROBLEM
INPUT: given an array -> contains string elements
OUTPUT: return an array of subarrays -> each subarr has all anamgrams grouped together

Rules:
  - Given an array of string 'words'
  - Return a 2D array, where subarrays contain anagrams
  - What is an anagram>
    - An anagram are words that are spelled using the same letters
    - Anagrams must contain the same count of letters
      - I.E., rate rater are not anagrams even tho they contain the same letters
    
Assumptions:
  - What happens if empty array given?
    - Return null
  - Will we ever receive an aray with nested arrays?
    - No, assume only 1Dimensional array
  - Will the given array ever contain non string elements?
    - No, only string elements
  - Will we ever have a spare array?
    - No sparse arrays to be expected
  

---- EXAMPLES
['eat', 'tea', 'tan', 'ate', 'nat', 'bat']
  - ['eat', tea, ate]
  - [tan, nat]
  - [bat]

['eat', 'tea', 'tan', 'ate', 'nat', 'bat', 'eata']
  - ['eat', tea, ate]
  - [tan, nat]
  - [bat]
  - [eata]

---- DATA STRUCTURES
- ideal to work within given data structure array
- filter based off a given requirement

---- ALGORITHM
1. Return null if empty array
2. Sort the given words and select all the unique words
  - Sort the given array of words
  - For each word
    - Push the word to a new array
    - If the word already exists in the new array
      - Dont push it

3. Compare the givne unique words over the given array and group them according to a match ** HELEPR
  - For each unique word
    - Filter all grouped words into an array based on if they match the current unique word
    - Push the array of grouped words into a holding array
  - Return the grouped array of subarrays

4. Return the grouped anagrams



*/

function anagramGroups(words) {
  if (words.length === 0) return null;
  let uniqueWords = [];
  let sortedWords = words.map(word => word.split('').toSorted().join(''));
  sortedWords.forEach(word => {
    if (!uniqueWords.includes(word)) uniqueWords.push(word);
  });

  let groupedWords = findAnagrams(uniqueWords, words);
  return groupedWords;
}

function findAnagrams(uniqueWords, words) {
  let groupedWords = [];
  uniqueWords.forEach(word => {
    let anagrams = words.filter(anagram => {
      return word === anagram.split('').toSorted().join('');
    });
    groupedWords.push(anagrams);
  });

  return groupedWords;
}

console.log(anagramGroups(['eat', 'tea', 'tan', 'ate', 'nat', 'bat'])); // should return: [['eat', 'tea', 'ate'], ['tan', 'nat'], ['bat']]
console.log(anagramGroups(['eat', 'tea', 'tan', 'ate', 'nat', 'bat', 'eata'])); // should return: [['eat', 'tea', 'ate'], ['tan', 'nat'], ['bat'], ['eata']]
console.log(anagramGroups([])); // null

console.log(anagramGroups(['listen', 'silent', 'enlist', 'inlets'])); // [['listen', 'silent', 'enlist', 'inlets']]
console.log(anagramGroups(['hello', 'world', 'dlrow'])); // [['hello'], ['world', 'dlrow']]
console.log(anagramGroups(['abc', 'def', 'fed', 'bac', 'cab'])); // [['abc', 'bac', 'cab'], ['def', 'fed']]
console.log(anagramGroups(['a'])); // [['a']]
console.log(anagramGroups([''])); // [['']]