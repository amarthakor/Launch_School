
/*
You are given an array containing multiple nested arrays of varying depths. 
Each nested array contains numbers, but some may also contain empty subarrays. 
Your goal is to write a function that processes this input and returns a single 
array with all numbers sorted in ascending order.

Do not use the sort method.


const input1 = [[3, [2, 1]], [5, [4, [6]]]];

Output: [1, 2, 3, 4, 5, 6]

const input2 = [[10, 5, [5, 10]], [20, 15], []];

Output: [5, 10, 15, 20]

---- PROBLEM
INPUT: Given with nested subarrays
OUTPUT: A single array with all integers sorted in ascending order, so smallest to largest

Rules:
- Cant use sort() method
- Some subarrays may be empty, others will vcontain various amounts of elements that are ints
- Return a 1 dimensional array

Assumptions:
  - Subarrays will always be number types or empty
  - May include negative numbers, but not other special types of numbers
  - If given an empty array
    - Return an empty array
  - Argument will always be an array
  - Always receive precisely one array arg
  - Remove all duplicate elements, should only contain a single copy

---- EXAMPLES
const input1 = [[3, [2, 1]], [5, [4, [6]]]];
  - Given [[3, [2, 1]], [5, [4, [6]]]]
    - 3, 2, 1, 5, 4, 6
    -> [1, 2, 3, 4, 5, 6]
Output: [1, 2, 3, 4, 5, 6]

const input2 = [[10, 5, [5, 10]], [20, 15], []];

Output: [5, 10, 15, 20]

---- DATA STRUCTURES
- stick w/ array 

---- ALGORITHM
1. Handle any special types of inputs
  - If given empty array
    - Return empty array
2. Create a flattend array of integers
3. SElect all unique integers
3. Sort these ints from least to greatest #cant use sort() ** helper 2
4. Return the sorted array

** helper1
createFlatArray
- Looping over the current array
  - find the length of the array
  - Flatten the array
    - original length of my array and the flatten length of my array are the same
      - Call one final flat on the array
    - if originalLength !== currentLength
      - repeat the loop

** helper2
- Loop over my uniq numbers
  - Init swap to false;
  - Compare the current the element to the next
  - If the current is greater than the next element
    - Flip their position
    - `swap` true
  - If not, 
    - continue onto the next element
- break out if swap set to false
- return the array of sorted numbers
*/

function sortNumbers(numbers) {
  if (numbers.length === 0) return [];

  let flatArray = createFlatArray(numbers);
  let uniqInts = findUniqInts(flatArray);
  return sortInts(uniqInts);
}

function createFlatArray(numbers) {
  let previousLength = numbers.length
  let currentLength = numbers.flat().length;

  while (previousLength !== currentLength) {
    currentLength = numbers.length;
    numbers = numbers.flat();
    previousLength = numbers.length;
  }

  numbers = numbers.flat();
  return numbers;
}

function findUniqInts(numbers) {
  let uniqInts = [];

  numbers.forEach(num => {
    if (!uniqInts.includes(num)) uniqInts.push(num);
  });

  return uniqInts;
}

function sortInts(numbers) {
  let length = numbers.length;
  let swap = true;

  while (swap) {
    swap = false;
    for (let idx = 0; idx < length - 1; idx += 1) {
      let firstNum = numbers[idx];
      let secondNum = numbers[idx + 1];

      if (firstNum > secondNum) {
        numbers[idx] = secondNum;
        numbers[idx + 1] = firstNum;
        swap = true;
      }
    }
    length -= 1;
  }

  return numbers;
}


let input1 = [[3, [2, 1]], [5, [4, [6, [7]]]]]; // Output: [1, 2, 3, 4, 5, 6]
console.log(sortNumbers(input1));
let input2 = [[10, 5, [5, 10]], [20, 15], []]; // Output: [5, 10, 15, 20]
console.log(sortNumbers(input2));

console.log(sortNumbers([]));