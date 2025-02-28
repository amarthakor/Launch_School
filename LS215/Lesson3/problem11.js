// Rotate Matrix
// Write a function that rotates an n x n 2D matrix by 90 degrees clockwise. You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

// javascript
/*
---- PROBLEM
INPUT: a 2D matrix, `n` x `n` -> a 2d nested array that is `n` by `n` square
OUTPUT: return the 2D matrix rotated 90 degrees clockwise

Rules:
  - Given 2D matrix, `n` by `n` square
    - each subarray will have the same amount of elements and the total amount of subarrays
      match the length of each subarray
    - essentially a `square`

  - Return a rotated 90degree clockwise matrix
    - What does 90 degree clockwise rotation mean?
    - Besides the centerpiuec element, every element should be shifted to its corner
  - need to mutate the given array
Assumptions:
- Will we ever receive more than one argument?
  - No alwayus one argument
- Will we ever receive a non array argument>
  - No always an array argument
- Can the elements within the subarrays ever be different types>
  - Can be different primitive types
- Will a subarray ever contain yet another nested array (or more nested subarrs?)
  - No, always a 2D array representation
- Will we ever receive an empty array arg?
  - Yes, in that case return an empty array

---- EXAMPLES
- Given:
  [1,2,3],
  [4,5,6],
  [7,8,9]
- Shift everything where index 0 elements becomes subarray 0 elements reversed #reverse
- index 1 elements become subarray 1 elements reversed
- so on so forth until `n` subarrays have been rotated
  - index 0 elements = [1, 4, 7]
  - index 1 elements = [2, 5, 8]
  - index 2 elements = [3, 6, 9]
  - reverse these subarrays:
  [7, 4, 1]
  [8, 5, 2]
  [9, 6, 3]

---- DATA STRUCTURES
- given an array structure and return array strucuture
- for loop would allow us to select all elements in the current column and reset to
   the row we want since we are given a `square` thus the first subarray would also
   select all first elements in each subarray aka subarray [0] would select elements at
   index 0 for each subarray

---- ALGORITHM
1. Return empty array if given empty array
2. Mutate the given array and rotate each subarray by the given rules above
3. Return the mutated array


** helper func
rotateArray
- Loop over each subarray length = array size
  - For each subarray
    - Select all elements from every subarray the given index into an array
    - Reassign the current subarray to the array of selected elements
- Return the mutated array

*/

function rotateMatrix(matrix) {
  if (matrix.length === 0) return [];
  return rotateArray(matrix);
}

function rotateArray(matrix) {
  let rotatedSubarrs = [];
  matrix.forEach((row, idx) => {
    let newSubarr = [];
    matrix.forEach(subarr => {
      newSubarr.push(subarr[idx]);
    });
    rotatedSubarrs.push(newSubarr.reverse());
  });

  matrix.forEach((subarr, idx) => {
    matrix[idx] = rotatedSubarrs[idx];
  })

  return matrix;
}
console.log(rotateMatrix([])); // []

let input1 = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
];
console.log(rotateMatrix(input1));
console.log(input1, 'this is input1');

// Should return:
// [
//   [7,4,1],
//   [8,5,2],
//   [9,6,3]
// ]

console.log(rotateMatrix([
  [ 5, 1, 9,11],
  [ 2, 4, 8,10],
  [13, 3, 6, 7],
  [15,14,12,16]
]));

// Should return:
// [
//   [15,13, 2, 5],
//   [14, 3, 4, 1],
//   [12, 6, 8, 9],
//   [16, 7,10,11]
// ]

// javascript

// Test Case 1: 2x2 matrix
console.log(rotateMatrix([[1, 2], [3, 4]]));
// Expected: [[3, 1], [4, 2]]

// Test Case 2: 1x1 matrix
console.log(rotateMatrix([[5]]));
// Expected: [[5]]

// Test Case 3: 3x3 matrix with negative numbers
console.log(rotateMatrix([[-1, -2, -3], [-4, -5, -6], [-7, -8, -9]]));
// Expected: [[-7, -4, -1], [-8, -5, -2], [-9, -6, -3]]

// Test Case 4: 4x4 matrix with mixed numbers
console.log(rotateMatrix([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]));
// Expected: [[13, 9, 5, 1], [14, 10, 6, 2], [15, 11, 7, 3], [16, 12, 8, 4]]

// Test Case 5: 3x3 matrix with floating point numbers
console.log(rotateMatrix([[1.1, 2.2, 3.3], [4.4, 5.5, 6.6], [7.7, 8.8, 9.9]]));
// Expected: [[7.7, 4.4, 1.1], [8.8, 5.5, 2.2], [9.9, 6.6, 3.3]]