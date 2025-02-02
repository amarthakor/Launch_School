// Create a function that counts the number of subarrays in a 2D array that contain the elements within a given array.


/*
----- Problem
INPUT: given 2 arguments, first one is an array filled w nested arrays, second argument is an array of integers
OUTPUT: integer

Rules:
  - I want to count how many subarrays in the first argument
    have the same elements as the second array argument
  - Order of elements doesn't matter as long as all elements are the same

Assumptions:
- If one or both are arugments are empty arrays?
  - if first arg is empty return null
  - if second arg is empty, assume that all of the elements are included in the 2D subarray
    - ([[1, 2, 3], [2, 3, 4], [3, 1, 2]], []) === 3
    - basically if second argument is empty, return length of the given array
- No need to worry about sparse arrays
- Always receive 2 arguments exactly
- Both arguments will always be arrays
- No objects will be nested within any of the subarrays
- Subarrays can contain any primitive value
- Subarrays can potentially contain no elements
- Duplicate values dont count as long as all the elemnents
contained are the same
  - ([[1, 1, 2, 3], [1, 2, 3]], [1, 2, 3, 1]) === 1);
    []
- ([[], []], [1]) === 0

----- Examples
sameElements([[1, 2, 3], [2, 3, 4], [3, 1, 2]], | [1, 2, 3])
  - 2 arguments
    - first arg: [[1, 2, 3], [2, 3, 4], [3, 1, 2]]
    - second arg: [1, 2, 3]

  - how many subarryas within the first argument contain the same elements as the second:
    - [1, 2, 3], [3, 1, 2] -> return 2

console.log(sameElements([], [1]) === null);
console.log(sameElements([[1], [2], [3]], []) === 3);

console.log(sameElements([['1', 2, 3], [1, 2, 3], ['1', 2, 3 '1']], ['1', 2, 3]) === 2);
console.log(sameElements([[], []], [0]) === 0);
  - When given subarrays with no elements, only if it matches the second arg does it count as a matche
  -
----- Data Structures
- array

arg1 = [[1, 2, 3], [2, 3, 4], [3, 1, 2]] // arg2 = [1, 2, 3]
[1, 2, 3] => match
[2, 3, 4] => not match
...
...


----- Algorithm
- RETURN null if first arg is empty []
- RETURN length of first arg if second arg is empty []
- SET a counter `var` to 0 to reflect all matches in arg1

- COUNT all subarrays in my first argument that contain the same elements as the second argument
  - CHECK each subarray in the arg1
    - IF the current subarr qualifies as a match (HELPER METHOD)
      - INCREMENT the counter by + 1
    - OTHERWISE move onto the next subarr within arg1

- RETURN the count

-- HELPER METHODS --
helper isAMatch? -> takes current subarr and arg2 as an argument
- CHECK all elements in arg1 to see if contained in arg2
  - TRANSFORM arg1 array into values of booleans
    - IF the curr element is included in arg2
      - return true
    - ELSE
      - return FALSE
- RETURN true if all elements in arg1 are contained in arg2 && arg1 length is >= arg2 length
  - IF transformed arr contains a false or arg1 length < arg2 length
    - RETURN false
  - ELSE
    - return TRUE;

*/
function sameElements(arr1, arr2) {
  if (arr1.length === 0) return null;
  if (arr2.length === 0) return arr1.length;
  let matches = 0;

  arr1.forEach(subarr => {
    if (isAMatch(subarr, arr2)) matches += 1;
  });

  return matches;
}

function isAMatch(arr1, arr2) {
  arr1 = arr1.map(ele => arr2.includes(ele) && equalCounts(ele, arr1, arr2));

  return !arr1.includes(false) && arr1.length >= arr2.length;
}

function equalCounts(element, arr1, arr2) {
  arr1 = arr1.filter(ele => ele === element).length;
  arr2 = arr2.filter(ele => ele === element).length;

  return arr1 >= arr2;
}

// console.log(equalCounts(1, [1, 2, 2], [1, 1, 2])); // false
// console.log(equalCounts(1, [1, 1, 2], [1, 1, 2])); // true

console.log(sameElements([[1, 2, 3], [2, 3, 4], [3, 1, 2]], [1, 2, 3]) === 2);
console.log(sameElements([], [1]) === null);
console.log(sameElements([[1, 1, 2, 3, 4, 4]], [1, 2, 3, 4]) === 1);
console.log(sameElements([[1], [2], [3]], []) === 3);
console.log(sameElements([['1', 2, 3], [1, 2, 3], ['1', 2, 3, '1']], ['1', 2, 3]) === 2);
console.log(sameElements([[], []], [0]) === 0);
console.log(sameElements([[1, 1, 2, 3], [1, 2, 3]], [1, 2, 3, 1]) === 1);
console.log(sameElements([[1, 2, 3], [2, 3, 4], [3, 1, 2]], [1, 1, 2, 3]) === 0);
console.log(sameElements([[1, 2], [1, 1, 2], [1, 2, 2]], [1, 1, 2]) === 1);
console.log(sameElements([[1, 2, 3, 1], [2, 3, 4], [3, 1, 2]], [1, 2, 3]) === 2);
console.log(sameElements([['1', 2, 3], [2, 3, 4], [3, 1, 2]], [1, 2, 3]) === 1);
console.log(sameElements([[null, false, true], ['string', true, true], [false, 29, null]], [null, false]) === 2);
console.log(sameElements([[1, 2, 3], [2, 3, 4], [3, 1, 2]], []) === 3);
console.log(sameElements([[]], [1, 2, 3]) === 0);
console.log(sameElements([], [1, 2, 3]) === null);

/*
Amar Notes

Start
P: 2:11
E: 2:25
D: 2:40
A: 2:43
C: 2:52

Good:
- Good job talking through your thought process
- Wrote out all assumptions
- Solid list of questions
- Great high-level algorithm
    - Love your use of CAPS to emphasize point of step

Improvement:
- Pick apart the words from the prompt and relate it to your given test case
    - 'subarrays'
    - 'elements'
    - 'given array'
- Create examples outside of PEDAC for efficiency
- While I love all of the written explanation, doing so slows you down a lot. Find ways to shorthand your notes so you're not typing so much.
- With assumptions, check EVERY data structure
- Label test cases for clarity
- Play around with code before starting Algorithm
    - You talk through steps you want to do, type out examples to visualize better
- Helper functions!
    - Breaking the problem up into pieces will help with testing
- Walk an example through your algorithm before starting coding
- Utilize high-level methods
    - filter/map/reduce
- Think about ways the code can break your algorithm logic
*/