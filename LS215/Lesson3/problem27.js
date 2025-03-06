// Question 2: Array Chunking (Intermediate)
// Problem​: Write a function that splits an array into groups of a specified size and returns them as a two-dimensional array. If the array can't be split evenly, the final chunk will contain the remaining elements.

/*
-- PROBLEM --
iNPUT:  array and an integer
OUTPUT: a nested array

Rules:
  -Given an array of elements and a target size integer
    - Return an array of subarrays where
    - The subarrays consist of `n` elements referenced by the target size
    - If the subarrays cant be split evenly, the final subarray
      will contain all remaingin elements

Assumptions:
  - How should I handle an empty array?
    - Return an empty array
  - Will the integer argument always be greater than 0?
    - Yes it will always be at least 1 or greater
  - How should we handle missing arguments?
    - Return null
  - What about additional arguments?
    - Ignore additional arguments
  - What if the arguments are not an array or integer respectively?
    - Return null
  - Will the given array ever contian subarrays and how should that be handled if so?
    - Elements will always be primities or obnjects, never arrays
  - Wjat about sparse arrays?
    - Arrays will never be sparse arrays

-- Examples --
- Given [1, 2, 3, 4, 5], 2) == [[1, 2], [3, 4], [5]]
  - Return an array of subarrays max length 2
  - [[1, 2], [3, 4], [5]]

-- Data Structures --
- given ana rray and return a nested array, array areoptiaml

-- Algorithm --
1. Handle invalid cases
2. Create a holding array of suabrrs
3. Create subarrays of `n` length based off our given inputs ** Helper
  - Loop over the given array
    - Init a counter to 0
    - Create a subarr of every n elements # slice
    - Append this subarr to the holding array
    - Increment the counter by 3
  - Return holding array
4. Return the holding array of subarrs


*/

function chunkArray(arr, size_limit) {
  if (!Array.isArray(arr) || !Number.isInteger(size_limit)) return null;
  if (size_limit < 1) return null;

  let allSubarrs = [];

  for (let currEle = 0; currEle < arr.length; currEle += size_limit) {
    allSubarrs.push(arr.slice(currEle, currEle + size_limit));
  }

  return allSubarrs;
}

console.log(chunkArray(12, 1)); // null
console.log(chunkArray([1, 2, 3])); // null
console.log(chunkArray([1, 2, 3, 4], 'hello')); // null
console.log(chunkArray([], 4)); // []
console.log(chunkArray([1, 2, 3, 4, 5], 2))// == [[1, 2], [3, 4], [5]]
console.log(chunkArray(['a', 'b', 'c', 'd', 'e', 'f'], 3))// == [['a', 'b', 'c'], ['d', 'e', 'f']]
console.log(chunkArray([1, 2, 3, 4, 5], 10))// == [[1, 2, 3, 4, 5]]


// javascript

// Edge case: size_limit is exactly the array length
console.log(chunkArray([1, 2, 3], 3)); // [[1, 2, 3]]

// Edge case: size_limit is 1 (each element in its own subarray)
console.log(chunkArray([1, 2, 3], 1)); // [[1], [2], [3]]

// Edge case: array with undefined/null values
console.log(chunkArray([1, undefined, null, 4], 2)); // [[1, undefined], [null, 4]]

// Edge case: decimal number for size_limit (should return null as it's not an integer)
console.log(chunkArray([1, 2, 3], 1.5)); // null

// Edge case: array with object elements
console.log(chunkArray([{a: 1}, {b: 2}, {c: 3}], 2)); // [[{a: 1}, {b: 2}], [{c: 3}]]

// Edge case: size_limit = 0 (invalid input)
console.log(chunkArray([1, 2, 3], 0)); // null

// Edge case: negative size_limit (invalid input)
console.log(chunkArray([1, 2, 3], -2)); // null