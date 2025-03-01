// Write a function that rotates an array by a given number of positions. The rotation should work for both positive (left rotation) and negative (right rotation) numbers.

/*
INPUT: An array and integer
OUTPUT: Modified array

Rules:
  - Given an array of elements and apositive or negative integer
    - If the integer given is positive
      - Move every element `n` positions to the left
    - If the integer given is negative
      - Move every element `n` positions to the right
  
Assumptions:
  - Can the given array contain different types of elements?
    - Can contain different primitive values
  - Can the given integer be special number types i.e. NaN, Infinity, floats etc?
    - No always a positive or engative integer (0 is positive)
  - If given 0, how do we rotate our elements?
    - Return array as is if 0 is given
  - How to deal with non array or non integer argument respectively?
    - Return null if either are not the expected data type
  - How to deal with an empty array?
    - Return empty array
  - What to do with missing arguments or additional arguments?
    - You will always have precisely two arguments
  - Will integer given ever be larger than size of array?
    - Yes, in which case repeat rotations until everything is rotated correctly
___________________
rotateArray([1, 2, 3, 4, 5], 2)); // [3, 4, 5, 1, 2]
  - Given [1 2 3 4 5], integer arg 2
    - This means we rotate to the left by 2
    - Remove first `n` (2) elements
      -> [3, 4, 5]
    - Add them back in towards the end
      -> [3, 4, 5] + [1, 2]
  -> [3, 4, 5, 1, 2]
    - Shift to remove from the beginning or slice out starting at the correct index

rotateArray([1, 2, 3, 4, 5], -1)); // [5, 1, 2, 3, 4]
  - Given [1, 2, 3,4 , 5] integer arg -1
    - For negative args we rotate to the left ( n = -1)
    - Remove last `n` elements or 1 elemnt
    - ADd it to the front
    - Thus we get [5] + [1, 2, 3, 4]
  -> [5, 1, 2, 3, 4]

rortateArray([1, 2, 3], 5) // []
Given [1, 2, 3]
 - Shift to the 5 left times
    - [2, 3, 1] 1
    - [3, 1, 2] 2
    - [1, 2, 3] 3
    - [2, 3, 1] 4
    - [3, 1, 2] 5
 - 5 - 3 = 2
 - [3, 1, 2]
_______________________________
- since were given an array and return an array
- Array will be best use case to modify via slicing and adding / removing

___________________________
1. Handle edge cases
2. If given int arg is larger than array size
  - Reduce given int arg until its within array bounds
  - While given int is larger than array size
    - Subtract by `n` size until int size is less than array size

2a. Rotate array to the left by `n` positions if `n` is positive ** HELPER **
  - Slice chunk of array starting at index of `n` and set to `firsthalf`
  - Slice chunk of array from 0 to `n` and set to `secondhalf`
  - combine arrays into one `secondhalf` + `firsthalf`

2b. Rotate array to the right by `n` positions if `n` is negative ** HELPER **
  - slice chunk of array starting at array length - `n` and set to `firsthalf`
  - slice chunk of array startong at 0 upto arr length - `n` and set to `secondhalf`
  - combine arrays into one 'firstHalf` + secondhalf #concat

3. Return the rotated array
*/

function rotateArray(arr, shiftValue) {
  if (!Array.isArray(arr) || !Number.isInteger(shiftValue)) return null;
  if (arr.length === 0) return [];

  let shiftDirection = shiftValue > 0 ? 'left' : 'right';
  shiftValue = reduceShiftValue(arr, shiftValue);

  if (shiftDirection === 'left') {
    return rotatePositive(arr, shiftValue);
  } else {
    return rotateNegative(arr, shiftValue);
  }
}

function reduceShiftValue(arr, shiftValue) {
  shiftValue = Math.abs(shiftValue);

  while (shiftValue > arr.length) {
    shiftValue -= arr.length;
  }

  return shiftValue;
}

function rotatePositive(arr, shiftValue) {
  let firstHalf = arr.slice(shiftValue);
  let secondHalf = arr.slice(0, shiftValue);
  return firstHalf.concat(secondHalf);
}

function rotateNegative(arr, shiftValue) {
  let firstHalf = arr.slice(arr.length - shiftValue);
  let secondHalf = arr.slice(0, arr.length - shiftValue);
  return firstHalf.concat(secondHalf);
}

// console.log(reduceShiftValue([1, 2, 3], 3));
// console.log(reduceShiftValue([1, 2, 3], 5));
// console.log(rotateNegative([1, 2, 3], 2)); // [2, 3, 1]
// console.log(rotateNegative([1, 2, 3], 3)); // [1, 2, 3]
// console.log(rotateNegative([1, 2, 3], 1)); // [3, 1, 2]
// console.log(rotatePositive([1, 2, 3], 2));
// console.log(rotatePositive([1, 2, 3], 3));
// console.log(rotatePositive([1, 2, 3], 1));

console.log(rotateArray([1, 2, 3, 4, 5], 2)); // [3, 4, 5, 1, 2]
console.log(rotateArray([1, 2, 3, 4, 5], -1)); // [5, 1, 2, 3, 4]
console.log(rotateArray([1, 2, 3, 4, 5], 8)); // [4, 5, 1, 2, 3];
console.log(rotateArray([1, 2, 3, 4, 5], -8)); // [3, 4, 5, 1, 2]
console.log(rotateArray(1, 1)); // null
console.log(rotateArray([], 2)); // []
console.log(rotateArray([1, 2, 3], [12])); // null