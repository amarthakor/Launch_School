// 5.  Number and Array Problem:
//    Create a function that takes an array of numbers and a target sum. The function should return all pairs of numbers from the array that add up to the target sum. Each number can only be used once, and the function should not return duplicate pairs.

/*
PROBLEM:
INPUT: 2 arguments, an array and am integer
OUTPUT: an array of subarrays

Rules:
  - Given an array of integers and an integer 'target sum'
    - Return all pairs of numbers frmo the array that add upto the sum
    - Each number can only be used once
    - Should not return duplicate pairs
    - What does duplicate pairs mean bc 3rd test case returns two pairs that are the same?
      - Same numbers can not be in another pair, have to be unique numbers
  
Assumptions:
  - Can a single number be used more than once if paired with different numbers?
    - Yes, in the case of the 3rd test case, we have [1, 5], [1, 5]
  - Will the given array ever contain different elements that are not integers?
    - No the elements within the given array will always be integers that are positive 0 or greater
  - Will the second argument always be an integer > 0?
    - Yes always greater than 0
  - What if we are missing an argument?
    -Return null
  - What if the first arg is not an array and/or the second arg is not an integer?
    - Return null
  - How should we handle an empty array?
    - Return an empty array
  
  -- Examples --
  [1, 2, 3, 4, 5]
    2 + 5 = 7
    3 + 4 = 7
  -> [[2, 5], [3, 4]]

  [[1, 5], [1, 5]]

  - case where 2nd argument is missing
  - case where 1st or 2nd orboth args are not correct  type (Array / positive integer)

--- Data Strictures ---
- given an array
- return an array or nested subarray

--- Algorithm ---
1. Handle all null cases
2. Create an array to hold all valid pairs
3. Select all valid pairs ** Helper **
4. Return all valid pairs

Helper selectValidPairs
1. Select all valid pairs
- Create a holding array 
- For each element except the last element (integer)
  - Loop over the array
    - Find the index of the outer loop and increment it by one, set to inner index
    - If the outer element and the element at the inner index === targetSum
      - Select them and push to holding array
    - Increment the inner index by 1
- Return the holding array
*/

function selectValidPairs(numbers, targetSum) {
  let validPairs = [];
  numbers.forEach((outerNum, outerIdx) => {
    for (let innerIdx = outerIdx + 1; innerIdx < numbers.length; innerIdx += 1) {
      if (outerNum + numbers[innerIdx] === targetSum && checkRepeats(numbers, validPairs, outerNum, numbers[innerIdx])) validPairs.push([outerNum, numbers[innerIdx]]);
    }
  });

  return validPairs;
}

function findPairs(numbers, targetSum) {
  if (!Array.isArray(numbers) || !Number.isInteger(targetSum)) return null;

  return selectValidPairs(numbers, targetSum);
}

function checkRepeats(numbers, currentPairs, firstNum, secondNum) {
  currentPairs = currentPairs.concat([firstNum, secondNum]);
  let numOneTotal = numbers.filter(num => num === firstNum).length;
  let numTwoTotal = numbers.filter(num => num === secondNum).length;

  let actualNumOne = currentPairs.flat().filter(num => num === firstNum).length;
  let actualNumTwo = currentPairs.flat().filter(num => num === secondNum).length;

  if (numOneTotal >= actualNumOne && numTwoTotal >= actualNumTwo) {
    return true;
  } else {
    return false;
  }
}

console.log(JSON.stringify(findPairs([1, 2, 3, 4, 5], 7)) === JSON.stringify([[2, 5], [3, 4]]));
console.log(JSON.stringify(findPairs([1, 2, 3, 4, 5], 10)) === JSON.stringify([]));
console.log(JSON.stringify(findPairs([3, 1, 4, 1, 5], 6)) === JSON.stringify([[1, 5]]));
console.log(JSON.stringify(findPairs([10, 5, 2, 3, 7, 5], 10)) === JSON.stringify([[5, 5], [3, 7]]));
console.log(JSON.stringify(findPairs([], 10)) === JSON.stringify([]));

// Negative numbers
console.log(JSON.stringify(findPairs([-1, 0, 1, 2, 3], 2)) === JSON.stringify([[-1, 3], [0, 2]]));

// Large numbers
console.log(JSON.stringify(findPairs([100, 200, 300, 400], 500)) === JSON.stringify([[100, 400], [200, 300]]));

// // Array with mostly duplicates
console.log(JSON.stringify(findPairs([2, 2, 2, 2], 4)) === JSON.stringify([[2, 2], [2, 2]]));

// Missing arguments
console.log(findPairs([1, 2, 3]) === null);

// Invalid argument types
console.log(findPairs("not an array", 5) === null);
console.log(findPairs([1, 2, 3], "not a number") === null);

// Target sum that's smaller than any possible sum
console.log(JSON.stringify(findPairs([10, 20, 30], 5)) === JSON.stringify([]));

// Array with non-integer elements (if you want to be strict)
console.log(findPairs([1, 2, "3", 4], 5));// === null);