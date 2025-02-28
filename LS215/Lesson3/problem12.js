// 1.  Array Transformation:
// Write a function that takes an array of numbers and returns a new array where each element is the square of the original element if it's even, and the cube if it's odd.

/*
---- P
INPUT: Given an array of integers
OUTPUT: Array of transformed integers

Rules:
  - Given an array of odd an even integers
  - Transform even integers by square
  - Transform odd integers by cube
  - Return transformed array of ints

Assumptions:
- Will we ever receive an empty array?
  - Return empty array
- Will the array ever contain non integrs?
  - No, always integers
- How should we handle non array arguments?
  - Return null
- How should we handle additional arguments?
  - You will only receive one argument
- Will our integer elements ever be 0 or negative?
  - Potentially 

---- E
arrayTransform([1, 2, 3, 4, 5])); // [1, 4, 27, 16, 125]
  Given [1, 2, 3, 4, 5]
    - Transform evens by square
    - Transofrm odds by cube
    -> [2, 4] -> [4, 16]
    -> [1, 3, 5] -> [1, 27, 125]
    -> [1, 4, 27, 16, 125]

arrayTransform([10, 3, 7, 2])); // [100, 27, 343, 4]
arrayTransform([-1, 2, -3, 4, -5]); // [-1, 4, -27, 16, -125]
arrayTransform([]); // []
arrayTransform(1); // null

---- D
stay within given DS array

---- A
1. Return empty array if empty array arg / null if non array arg
2. Transform each element based on the rules stated above
  - If an element is even
    - square it
  - Else
    - cube it
3. Return this transformed array

*/
// javascript

function arrayTransform(numbers) {
  if (numbers.length === 0) return [];
  if (!Array.isArray(numbers)) return null;

  return numbers.map(num => {
    if (num % 2 === 0) {
      return Math.pow(num, 2);
    } else {
      return Math.pow(num, 3);
    }
  });
}

console.log(arrayTransform([1, 2, 3, 4, 5])); // [1, 4, 27, 16, 125]
console.log(arrayTransform([10, 3, 7, 2])); // [100, 27, 343, 4]
console.log(arrayTransform([-1, 2, -3, 4, -5])); // [-1, 4, -27, 16, -125]
console.log(arrayTransform([])); // []
console.log(arrayTransform(1)); // null
// Edge case 1: Array with zero
console.log(arrayTransform([0, 1, 2, 3])); // Expected: [0, 1, 4, 27]

// Edge case 2: Array with very large numbers
console.log(arrayTransform([1000000, 1000001])); // Expected: [1000000000000, 1000003000003000001]

// Edge case 3: Array with decimal numbers (assuming we round down to treat as integers)
console.log(arrayTransform([1.5, 2.7, 3.2])); // Expected: [1, 4, 27]

// Edge case 4: Array with string numbers (assuming we don't need to handle this, should return original array)
console.log(arrayTransform(['1', '2', '3'])); // Expected: [1, 4, 27] or ['1', '4', '27']

// Edge case 5: Nested arrays (assuming we don't need to handle this, should return original array)
console.log(arrayTransform([1, [2, 3], 4])); // Expected: [1, [2, 3], 16] or [1, 4, 16]

// Edge case 6: Object instead of array
console.log(arrayTransform({0: 1, 1: 2, 2: 3})); // Expected: null

// Edge case 7: Multiple arguments
console.log(arrayTransform([1, 2, 3], [4, 5, 6])); // Expected: [1, 4, 27]