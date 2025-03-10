// Write a function that takes a nested array and returns an array containing all the elements at any level of nesting.
/*
-- Problem --
INPUT: array
OUTPUT: array

Rules:
  - Given a nested array
  - Return:
    - An array of all elements and no subarrays
    - Essentially 1 dimensional array

Assumptions:
  - Will we ever be given non array arguments and how should we address them?
    - Return null
  - What if we are given a 1Dimensional array
    - Return the given array as is
  - Will we ever be given a sparse array?
    - No
  - How should we handle additional arguments
    - Ignore any additional rguments

-- Examples --
- Given ([1, [2, [3, 4], 5], 6])
  -> [1, [2, [3, 4], 5], 6] -> array size is 3 elements, 6 total elements
  -> [1, [2, 3, 4, 5], 6] -> array size is 3 elements, 6 total elements
  -> [1, 2, 3, 4, 5, 6] -> array size is 6 elements and 6 total elements
  -> array size === all individual elements in all subarrays
  -> [1, 2, 3, 4, 5, 6]

-- Data Structures --
- given an array argument
- return an array argument
- can use array methods like #flat to remove nested subarrs
- maintain array DS

-- Algorithm --
1. Handle non array args
2. Remove subarrays until my array length is no longer increasing
  - Find current array size
    - Loop over array where
      - Flatten the array once
      - Find its new length
      - If the new length is > than the previous length
        - Repeat loop
      - If the new length is == to the previous array length
      - Break out of the loop
  - Call flat once more in case of any single subarray elements
3. Return the final array 
*/

function deepElements(array) {
  if (!Array.isArray(array)) return null;

  let prevArrLength = array.length;
  let newArrLength = array.flat().length;
  while (prevArrLength < newArrLength) {
    prevArrLength = array.length;
    array = array.flat();
    newArrLength = array.length;
  }

  return array.flat();
}

// Test cases
console.log(deepElements([1, [2, 3], 4])); // === [1, 2, 3, 4]
console.log(deepElements([1, [2], 3])); // === [1, 2, 3]
console.log(deepElements([1, [2, [3, 4], 5], 6])); // === [1, 2, 3, 4, 5, 6]
console.log(deepElements([])); // === []
console.log(deepElements(12)); // null
console.log(deepElements([1, [2, 3], 4], 123)); // [1, 2, 3, 4]

// Empty nested arrays
console.log(deepElements([1, [], 2])); // === [1, 2]

// Deeply nested arrays
console.log(deepElements([[[[[1]]]]])); // === [1] need to figre solution w/o using #flat(infinity)

// Arrays with null and undefined
console.log(deepElements([1, null, [2, undefined]])); // === [1, null, 2, undefined]

// Arrays with mixed types
console.log(deepElements([1, 'string', [true, [2.5]]])); // === [1, 'string', true, 2.5]

// Nested empty arrays
console.log(deepElements([[], [[]]])); // === []

// Arrays with objects
let obj = {key: 'value'};
console.log(deepElements([1, [obj, [3]]])); // === [1, {key: 'value'}, 3]