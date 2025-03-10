// 3.  ​Advanced​: Write a function that takes an array of integers and a target sum. The function should return all pairs of integers from the array that sum up to the target. Each pair should only be included once, and the pairs should be sorted in ascending order.

/*
-- Problem --
INPUT: Given an array and an integer
OUTPUT: an array of subarrays

Rules:
  - Given an array of integers and an integer (targfet Sum)
  - Return array of subarrays where
    - Subarrays are integer PAIRS 2 element long that sum up to target sum
    - Each pair should be included once
    - Sort the pairs in ascending order

Assumptions:
  - Will the given array ever contain non integer numbers
    - No, elements will always be integers
  - Will the integers ever be 0, negative or other special type numbers?
    - Can be negative or 0, never Nan, Infinity, etc...
  - Will the targetSum always be a positive integer > 0?
    - Yes
  - Will the given array ever be a sparse array?
    - No sparse array arguments
  - How should I handle an empty array argument?
    - Return an empty array
  - How to handle non array / non positive integer arguments?
    - Return null
  - How should I handle missing arguments?
    - Return null
  - How to handle additional arguments?
    - Only receive 2 arguments

-- Examples --
- Given [1, 2, 3, 4, 5], 6
  - [1 2], [1, 3], [1, 4], [1, 5] -> [1, 5]
  - [2, 3], [2, 4], [2, 5]        -> [2, 4]
  - [3, 4], [3, 5]
  - [4, 5]
  -> [[1, 5], [2, 4]]

 - Given [3, 7, 2, 9, 5, 1, 8], 10
 - [3, 7], [3, 2], [3, 9], [3, 5], [3, 1], [3, 8] -> [3, 7]
 - [2, 8]
 - [9, 1]
 - [3, 7], [2, 8], [9, 1]
 - [3, 7], [2, 8], [1, 9]
 -> [[1, 9], [2, 8], [3, 7]]

-- Data Structures --
- given an array
- return an array
- utilize array for iteration, sorting, and identifying matching pairs

-- Algorithm --
1. Handle invalid cases
2. Find all pairs of numbers ** HELPER METHOD
3. Select all pairs of numbers that add to the target sum ** HELPER METHOD
4. Sort each subarray of valid pairs
  - For each subarray
    - Transform the subarray by sorting the subarray itself from least to greatest
    - sort((a, b)) a- b
5. Sort the entire array of subarrays by in ascending order by the first element
  - Sort the entire array based off each subarrays first elment
    - sort((a, b) => a[0] - b[0])
6. Return the sorted array of sorted subarray valid pairs

** Helper find all pairs
1. Find all pairs of numbers
  - For each number in the given array
    - Loop over the entire array starting at the index ahead of my outer loop
    - Append a subarray of [outerelement, innerElement]
- Returnthe array of all pairs

** Helper selectValid pairs
1. Select all pairs of subarrays that add to the target sum
  - Filter the array where the elements in each subarr === targetsum
- Return this filtered array

** Helper removeDuplicates
1. Remove any subarrays that are duplicates
- Create an array to hold my unique arrays
  - For each subarray
    - Convert it to a string representation
    - If the string representation does NOT exist in the uniq array
      - Push it to the uniq array and convert it to an array of single str integers
    - Else
      - Move onto the next element
- Convert all subarray elements into numbers
  - For each subarray
    - Transform all elements into an integer
- Return the uniq transformed array

*/
function removeDuplicates(pairs) {
  let uniqPairs = [];
  pairs.forEach(pair => {
    if (!uniqPairs.includes(String(pair))) uniqPairs.push(String(pair));
  });

  uniqPairs = uniqPairs.map(pair => pair.split(','));
  return uniqPairs.map(pair => {
    return pair.map(num => Number(num));
  });
}

function findPairs(numbers, targetSum) {
  if (!Array.isArray(numbers) || !Number.isInteger(targetSum)) return null;

  let pairs = findAllPairs(numbers);
  let validPairs = selectValidPairs(pairs, targetSum);

  validPairs.map(pair => pair.sort((a, b) => a - b));
  validPairs.sort((a, b) => a[0] - b[0]);
  return removeDuplicates(validPairs);
}

function findAllPairs(numbers) {
  let allPairs = [];

  numbers.forEach((outerNum, outerIdx) => {
    for (let innerIdx = outerIdx + 1; innerIdx < numbers.length; innerIdx += 1) {
      allPairs.push([outerNum, numbers[innerIdx]]);
    }
  });

  return allPairs;
}

function selectValidPairs(pairs, targetSum) {
  return pairs.filter(pair => pair[0] + pair[1] === targetSum);
}

// Example:
console.log(findPairs([], 10)); // []
console.log(findPairs(1, 1));   // null
console.log(findPairs([], '1')); // null
console.log(findPairs([1, 2, 3, 4, 5], 6)); // returns [[1, 5], [2, 4]]
console.log(findPairs([1, 1, 2, 3, 4, 5], 6)); // returns [[1, 5], [2, 4]]
console.log(findPairs([3, 7, 2, 9, 5, 1, 8], 10)); // returns [[1, 9], [2, 8], [3, 7]]

// javascript

// Empty array and edge cases
console.log(findPairs([], 10)); // []
console.log(findPairs([5], 10)); // [] (can't form a pair with one element)
console.log(findPairs(null, 10)); // null
console.log(findPairs(undefined, 5)); // null
console.log(findPairs([1, 2, 3], undefined)); // null
console.log(findPairs([1, 2, 3])); // null (missing targetSum)

// // Negative numbers and zero
console.log(findPairs([2, -3, 5, 0, 8, -10], -5)); // [[-10, 5], [-3, -2]]
console.log(findPairs([-3, -2, -1, 0, 1, 2, 3], 0)); // [[-3, 3], [-2, 2], [-1, 1]]
console.log(findPairs([0, 0, 1, 2], 0)); // [[0, 0]]

// Duplicates
console.log(findPairs([1, 1, 5, 5, 5], 6)); // [[1, 5]]
console.log(findPairs([3, 3, 3, 3], 6)); // [[3, 3]]
console.log(findPairs([5, 5, 7, 7], 12)); // [[5, 7]]

// No matching pairs
console.log(findPairs([1, 2, 3, 4], 10)); // []
console.log(findPairs([2, 4, 6, 8], 5)); // []

// // Large arrays with multiple pairs
console.log(findPairs([10, 5, 2, 3, 15, 7, 8, 12, -2, 3], 10)); // [[-2, 12], [2, 8], [3, 7], [5, 5]]