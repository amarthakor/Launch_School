// 4.  Combined String and Array Problem:
//    Implement a function that takes a string of words separated by spaces and returns an array of words, sorted by the number of distinct characters in each word. If two words have the same number of distinct characters, maintain their relative order in the original string.

/*
INPUT: string
OUTPUT: an array of words

Rules:
  - a 'word' are chars separated by whitespace on both sides
  - return array of words is sorted based on number of unique chars in each word
  - if two words have the same amount of uniq chars, order them relative to their
    appearance in the original string (first to last)

Assumptions:
  - Will we ever be given a string with just empty whitespace?
    - No
  - Will we ever have a string where some words are separated by multiple whitespaces?
    - Does this count as a word in between the whitespace?
    - No and no, each string will always have one whitespace in between words
  - How to handle nonstring arguments?
    - Return null
  - How to handle empty string args?
    - Return an empty array
  - How to handle additional arguments?
    - Ignore additional arguments
  - Can string ever contain uppercase / mix casse/ nonalphanumerical chrs?
    - Yes pottentioally

--------------- Examples ---------

- Given ""the quick brown fox jumps over the lazy dog""
  - Return ['the', 'the', 'dog', 'fox', 'over', 'lazy',"quick", "jumps", "brown"]
  - the fox the dog
  - over lazy
  - quick brown jumps

  -> [the fox the dog over lazy quick brown jumps]
  - finding the length of all unique chars for each word
  - then i am sorting all of the words by their unique char count from small to large

--------------- DATA STRUCTURES ------
- GIVEN A String i can use split to transform my string into an array
- I can iterate over the array to find things such as word count
- I can also sort the array on specific criteria

----------- Algorithm
1. Handle non string args
2. Convert the string into an array of words
3a. Create helper to find unique character count for a word
3. Transform array of words into an array of subarrays, the word and its unique word count *****
4. Sort the transforemd array of words via its second element (the word count) subarray[1]
  - Sort all subarrays by the unique char count
  - sort((a, b) => a[1] - b[1])

5a. Flatten out the sorted array
  - Either remove all nonstring args or create new array and increment all strings to new array
5b. Transform the sorted array of subarrays into the first element #subarray[0]
  - Transform sorted array, for each element (subarr)
    - Return the (subarr[0]) as the new value for the current element

6. Return the array of sorted words


function find UniqCharCount ** helper method **
1. Find the unique char count for a word
  - Set a counter to 0
  - Init an empty storage array;
  - For each char in the given string
    - If the current char does NOT exist in the storage array
      - Increment counter by + 1 and append the char to the storage array
    - If it does,
      - move onto the next char
  - Return the counter

function transformArray ** HELPER METHOD **
1. Transform array of words into an array of subarrays, the word and its unique word count
  - Transform over the array of words
  - For each transformation
    - Init `unique counter` to findUniqCharCount(current word)
    - Return a subarray of [current word, unique counter];
  - Return the transformed array of subarrays

*/

function uniqCharCount(word) {
  let counter = 0;
  let uniqChars = [];
  word.split('').forEach(char => {
    if (!uniqChars.includes(char)) {
      counter += 1;
      uniqChars.push(char);
    }
  });

  return counter;
}

function transformArray(words) {
  return words.map(word => [word, uniqCharCount(word)]);
}

function sortByDistinctChars(words) {
  if (words.length === 0) return [];
  if (typeof words !== 'string') return null;

  words = words.split(' ');
  words = transformArray(words); // maybe transformArray(words.split(' '));
  words.sort((a, b) => a[1] - b[1]);
  return words.map(subarr => subarr[0]);
}


console.log(JSON.stringify(sortByDistinctChars("the quick brown fox jumps over the lazy dog")) ===
            JSON.stringify(["the", "fox", "the", "dog", "over", "lazy", "quick", "brown", "jumps"]));
console.log(JSON.stringify(sortByDistinctChars("hello world")) === 
  JSON.stringify(["hello", "world"]));
console.log(sortByDistinctChars("world hello")) // === ["hello", "world"])
console.log(JSON.stringify(sortByDistinctChars("aaabbbcccdddeeefff")) === 
            JSON.stringify(["aaabbbcccdddeeefff"]));
console.log(JSON.stringify(sortByDistinctChars("")) === 
            JSON.stringify([]));
console.log(JSON.stringify(sortByDistinctChars("a b c d e f")) === 
  JSON.stringify(["a", "b", "c", "d", "e", "f"]));
            

// Case with words that have the same number of unique characters
console.log(JSON.stringify(sortByDistinctChars("cat dog rat")) === 
            JSON.stringify(["cat", "dog", "rat"]));

// Case with words containing non-alphanumeric characters
console.log(JSON.stringify(sortByDistinctChars("a#b c*d e&f!")) === 
            JSON.stringify(["a#b", "c*d", "e&f!"]));

// Case with words containing uppercase letters
console.log(JSON.stringify(sortByDistinctChars("aBcD EfGh IjKl")) === 
            JSON.stringify(["aBcD", "EfGh", "IjKl"]));

// Case with repeating characters in words
console.log(JSON.stringify(sortByDistinctChars("aaa ab abc abcd")) === 
            JSON.stringify(["aaa", "ab", "abc", "abcd"]));

// Case with non-string input
console.log(sortByDistinctChars(12345) === null);

// Case with mixed case where the same letter in different cases counts as different characters
console.log(JSON.stringify(sortByDistinctChars("aA bB cC")) === 
            JSON.stringify(["aA", "bB", "cC"]));

// Case with extreme length differences
console.log(JSON.stringify(sortByDistinctChars("a antidisestablishmentarianism")) === 
            JSON.stringify(["a", "antidisestablishmentarianism"]));