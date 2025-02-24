// 2.  Array Chunking:
// Create a function that takes an array and a chunk size, then returns a new array of subarrays, each at most the chunk size.

/*
----- PROBLEM
INPUT: array, integer
OUTPUT: nested array

Rules:
  - Given an array of elements
  - Given an integer
  - Output nested array woll consist of subarrays where the max length of each
    subarray will be === the given integer
  - If integer is > array size, return the array nested in an array
Assumptions:
  - Will we ever be given an array with nested subarrays?
    - No, assume the given argument will not have any subarrays
  - What should we do if given an empty array *****
    - Return an empty array
  - How to handle a sparse array? ****
    - Assume a sparse array will not be passed as an argument
  - What if the first arg is a not an array? *****
    - Return null
  - Will the second argument always be a positive integer = 0 or greater?****
    - Yes
  - Should we be able to handle other number values, such as negatives, NaN, Infinty, etc?***
    - If the number is not a positive whole number, return null
  - What should we do if given a non integer 2nd arg?
    - Return null
  - How should we handle additional arguments?
    - Ignore all add'l args
  - How should we handle cases where 0 is the second argument?
    - Return null
  - How should we handle missing arguments?
    - Return null
---- EXAMPLES
(chunk([1, 2, 3, 4, 5], 2));// == [[1, 2], [3, 4], [5]]
  - Given array of [1, 2, 3, 4, 5], integer of 2
  - This means return arr should consist of subarrs whose max length is 2
  - [1 2 3 4 5] = 5 / 2 -> 2.5, round up so well have 3 subarr in the arr
  - [[1, 2], [3, 4], [5]]
  - find the amount of subarras that will be in my return array
    - subarr_count
    - array length / given integer and then round up
    - subarr_count = 5 / 2 = 2.5 rounded up to 3
    -> Math.ceil(5 / 2) = 3
  - [], [1, 2, 3, 4, 5]
  - total_elements  = 0
    - 1 -> [[1]] total_elements + 1
    - 2 -> []

(chunk([1, 2, 3, 4, 5, 6, 7, 8], 3));// == [[1, 2, 3], [4, 5, 6], [7, 8]]

(chunk([1, 2, 3, 4, 5], 10));// == [[1, 2, 3, 4, 5]]
  - Given array [1, 2, 3, 4, 5], integer 10
  - Array size is 5, integer is 10
  - Bc int is > arr size ( 10 > 5)
  -> [[1, 2, 3, 4, 5]]

chunk([], 2);                   // === null
chunk(1, 2);                    // === null
chunk('1', 2);                  // === null
chunk([1, 2, 3], 0);            // === null
chunk([1], 0);                  // === null
chunk([1, 2, 3], Infinity);     // null
chunk([1, 2, 3], NaN);          // null
chunk([1, 2, 3], -1);           // null
chunk([1, 2, 3], -100);         // null
chunk([1, 2, 3], []);           // null
chunk([1, 2, 3], '5');          // null
chunk('[1, 2, 3]', 'Infinity'); // null
chunk([1, 2, 3], 2, [1, 2, 3]); // [[1, 2], [3]]
chunk([1, 2, 3], 2, 2);         // [[1, 2], [3]]

---- DATA STRUCTURES
- Since we're given an array, it will be ideal to stay within given data structure
- Also perhaps create new arr that will hold subarrs 

- Use for loop to iterate over array in chunks
  - chunk([1, 2, 3], 2,); // [[1, 2], [3]]
  - []
  - for subarr 1
  - slice the current array into a size of the given array
  - track the starting index ( 0) and increment it by the given integer to append the enxt
    - subarr at the correct starting point
  - track how many subarrs have been created starting from 0 upto the required amount

---- ALGORITHM
1. Return null for all invalid conditions
  *** Perhaps create helper method to handle all edge cases?
2. Create a new array filled with subarrays of elements from the given array
  - Init `total_subarr` -> array length / integer rounded up
  - Init `start_idx` -> set to 0
  - Init 'end_idx' and set to given integer
  - Init `chunked` array
  - Loop until `i` is greater than total_subarr
    - Slice the given array from the start_point to the end_idx
    - Append this arr as an arr into `chunked`
    - Increment start_idx and end_idx by given integer
3. Return this new array filled with subarrs
*/

function chunk(arr, size) {
  if (validateArguments(arr, size) === null) return null;
  let chunked = [];
  let start_idx = 0;
  let end_idx = size;
  let max_subarr = Math.ceil(arr.length / size);

  for (let subarr_count = 1; subarr_count <= max_subarr; subarr_count += 1) {
    let subarr = arr.slice(start_idx, end_idx);
    chunked.push(subarr);
    start_idx += size;
    end_idx += size;
  }

  return chunked;
}

function validateArguments(arr, size) {
  if (!Array.isArray(arr)) {
    return null;
  } else if (!Number.isInteger(size)) {
    return null;
  } else if (!(size >= 1)) {
    return null;
  }
}

// // standard cases
// console.log(chunk([1, 2, 3, 4, 5], 2));// == [[1, 2], [3, 4], [5]]
// console.log(chunk([1, 2, 3, 4, 5, 6, 7, 8], 3));// == [[1, 2, 3], [4, 5, 6], [7, 8]]
// console.log(chunk([1, 2, 3, 4, 5], 10));// == [[1, 2, 3, 4, 5]]
// console.log(chunk([1, 2, 3], 2, [1, 2, 3])); // === [[1, 2], [3]]
// console.log(chunk([1, 2, 3], 2, 2));         // === [[1, 2], [3]]
// console.log(chunk([], 2));                   // === [];

// // edge cases
// console.log(chunk(1, 2));                    // === null
// console.log(chunk('1', 2));                  // === null
// console.log(chunk([1, 2, 3], 0));            // === null
// console.log(chunk([1], 0));                  // === null
// console.log(chunk([1, 2, 3], Infinity));     // === null
// console.log(chunk([1, 2, 3], NaN));          // === null
// console.log(chunk([1, 2, 3], -1));           // === null
// console.log(chunk([1, 2, 3], -100));         // === null
// console.log(chunk([1, 2, 3], []));           // === null
// console.log(chunk([1, 2, 3], '5'));          // === null
// console.log(chunk('[1, 2, 3]', 'Infinity')); // === null
// Array with different data types
console.log(JSON.stringify(chunk([1, 'two', {three: 3}, [4], null, undefined], 2)) === 
            JSON.stringify([[1, 'two'], [{three: 3}, [4]], [null, undefined]]));

// Chunk size equal to array length
console.log(JSON.stringify(chunk([1, 2, 3, 4], 4)) === JSON.stringify([[1, 2, 3, 4]]));

// Chunk size one less than array length
console.log(JSON.stringify(chunk([1, 2, 3, 4], 3)) === JSON.stringify([[1, 2, 3], [4]]));

// Chunk size one more than array length
console.log(JSON.stringify(chunk([1, 2, 3], 4)) === JSON.stringify([[1, 2, 3]]));

// Array with one element
console.log(JSON.stringify(chunk([1], 1)) === JSON.stringify([[1]]));

// Floating point chunk size (should be treated as invalid)
console.log(chunk([1, 2, 3], 1.5) === null);

// Empty array with valid chunk size
console.log(JSON.stringify(chunk([], 5)) === JSON.stringify([]));

// Array with undefined elements
console.log(JSON.stringify(chunk([undefined, undefined, 1, 2], 2)) === 
            JSON.stringify([[undefined, undefined], [1, 2]]));

// Only one argument provided
console.log(chunk([1, 2, 3]) === null);

// Large array
console.log(chunk(Array.from({ length: 1000 }, (_, i) => i + 1), 100).length === 10);

// Very large chunk size
console.log(JSON.stringify(chunk([1, 2, 3], Number.MAX_SAFE_INTEGER)) === JSON.stringify([[1, 2, 3]]));