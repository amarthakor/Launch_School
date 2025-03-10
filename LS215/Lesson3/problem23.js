// 1.  ​Intermediate​: Write a function that takes an array of integers and returns the pair of integers that has the smallest absolute difference between them. If there are multiple pairs with the same absolute difference, return the first pair encountered.

/*
-- Problem --
INPUT: given array
OUTPUT: return array

Rules:
  - Given an array of integers
  - Find the smallest absolute difference between these integers
  - Return the pair w / the smallest abs difference
  - If we find multiple pairs w/ the same smallest difference
    - Return the first pair encounter

ASsumptions:
  - Will we ever have non integer elements in our array?
    - No, elements will always be integers
  - Can we ever have 0, negative, or other special number values such as NaN?
    - No, always positive integers (including 0)
  - How should we handle additional arguments
    - Ignore additional arguments
  - How should we handle an empty array?
    - Return an empty array
  - What about sparese arrayS?
    - Will not encounter a sparse array
  - What about non array arguments?
    - Return null

-- Examples --
- Given [10, 4, 8, 6, 12, 5]
  1. 10 - 4 = 6
  1. 10 -8 = 2
  1. 10 - 6 = 4
  1. 10 -12 = 2
  . 10 - 5 = 5
  2. 4 - 8 = 4
  2. 4 - 6 = 2
  2. 4 - 5 = 1
  3. 6 - 5 = 1
  ...
  4 - 5, 6 - 5 === 1
  [4, 5]

--- Data Structures ----
- given an array
- return the array
-find the smallest dif between all possible combos
- staying w. array would allow us to iterate / select combos

--- Algorithm ----
1. Handle null cases
2. Create an array to hold all smallestDiff matches
3. Create all combintations of 2 element subarrays ** Helper method nested iteration
4. Find the smallest difference between these 2 element subarrs #smallestDiff; *Helper
5. Select all 2 element subarrs where subarr[0] - subarr[1] === the smallest difference
  - Filter all subarrs where ele 1 - ele 2 === smallest diff
  - Return first pair

** Helper func
function createAllPairs(nums)
1. Create all combos of 2 element subarrays
- Create a holding array of all subarrs
- For each element in the given array
  - Loop thru the given array
    - Select the current outter element and the current inner element as a subarray
    - First num should be set to outter Index + 1
    - Move the 2element subarr into a holding array
- Return all subarrays

** Helper func findSmallestDiff(subarrs)
1. Calculate the smallest absolute difference between all pairs
- Set smallestDiff to infinity
  - For each subarr
    - Find the absolute difference between subarr[0] -subarr[1]
    - If this difference is smaller than `smallestDiff`
      - Reassign `smallestDiff` to this value
- Return `smallest diff`
*/

function createAllPairs(numbers) {
  let allPairs = [];

  numbers.forEach((outerNum, outerIdx) => {
    for (let innerIdx = outerIdx + 1; innerIdx < numbers.length; innerIdx += 1) {
      allPairs.push([outerNum, numbers[innerIdx]]);
    }
  });

  return allPairs;
}

function findSmallestDiff(pairs) {
  let smallestDiff = Infinity;
  pairs.forEach(subarr => {
    let currentDiff = Math.abs(subarr[0] - subarr[1]);
    if (currentDiff < smallestDiff) smallestDiff = currentDiff;
  });

  return smallestDiff;
}

function smallestDifference(numbers) {
  if (!Array.isArray(numbers)) return null;
  if (numbers.length === 0 || numbers.length === 1) return [];

  let allPairs = createAllPairs(numbers);
  let smallestDiff = findSmallestDiff(allPairs);
  return allPairs.filter(pair => Math.abs(pair[0] - pair[1]) === smallestDiff)[0];
}
// Example:
console.log(smallestDifference(111)); // null
console.log(smallestDifference([])); // []
console.log(smallestDifference([10, 4, 8, 6, 12, 5])); // returns [4, 5]
console.log(smallestDifference([1, 10, 25, 30, 14])); // returns [10, 14]


// Edge cases
console.log(smallestDifference([])); // []
console.log(smallestDifference([5])); // [] (only one element, no pairs possible)
console.log(smallestDifference(null)); // null
console.log(smallestDifference(undefined)); // null
console.log(smallestDifference(42)); // null

// Multiple pairs with same difference
console.log(smallestDifference([5, 10, 15, 20])); // [5, 10] (all pairs have difference of 5)
console.log(smallestDifference([3, 6, 9, 12])); // [3, 6] (all pairs have difference of 3)

// Zero difference (identical elements)
console.log(smallestDifference([5, 5, 8, 10, 12])); // [5, 5] (smallest possible difference is 0)
console.log(smallestDifference([1, 2, 3, 3, 4])); // [3, 3]

// Negative numbers
console.log(smallestDifference([-5, -3, 1, 4])); // [-5, -3]
console.log(smallestDifference([-10, -9, -8, -7])); // [-10, -9] (smallest diff is 1)

// Mixed positive and negative with zero
console.log(smallestDifference([-2, -1, 0, 1, 2])); // [-2, -1]

// Large numbers
console.log(smallestDifference([1000000, 1000001, 2000000])); // [1000000, 1000001]

// Unsorted array with many elements
console.log(smallestDifference([100, 22, 45, 66, 22, 98, 99, 67, 97, 45])); // [22, 22]