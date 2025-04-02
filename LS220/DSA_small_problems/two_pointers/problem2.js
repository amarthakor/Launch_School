/*
In this problem, you're given an array of numbers nums, and a specific integer k. Your objective is to compute the average value of each contiguous subarray of length k within the given array.

Requirements:

The input will be an array of numbers and an integer k.
You need to find the average of every contiguous subarray of size k in the array.
The output should be an array containing these averages.

--- Problem
iNPUT: array and integer arguments
OUTPUT: array

Rules:
  - given an array of numbers, and integer arg `k`
  - return an array where
    - compute the average value of each contiguous subarr length of `k`
    - avg is composed of subarr total / `k`
    
ASsumptions:
- Will array always contain integers?
  - Yes, no other numbers or data types
- Will argument 2 always be a positive integer?
  - Yes, no other data types and `k` will always be 1 or greater
- How should we handle an empty array arg?
  - return an empty array arg
- What if we have a missing arg?
  - There will always be precisely two args

--- Examples
- Given: [1, 2, 3, 4, 5, 6], 3 -> Return: [2, 3, 4, 5]
  - [1 2 3] / 3, [2, 3, 4] / 3, [, 3, 4, 5] / 3, [4, 5, 6] / 3
  - [2, 3, 4, 5]

- Given: [], 3 -> []
  - return [] if given array is empty

--- Data Structures
- utilize array to hold averages of contig subarrs
- iterate over given array to sum / avg contig subarrs

--- Algorithm
1. Return [] if given []
2. Create holding array `averages` for results
3. Set `subArrSum` to 0, set `left` to 0
3. FIND avgs for all contig subarrs
- Loop over given array
  - Increment subarrsum by current element
  - If index is greater than `K`
    - divide subarrsum by K and push into `averages`
    - decrement subarrsum by arr[left]
    - increment left by += 1
4. Return array of avg sums
*/

function findAverages(numbers, size) {
  if (numbers.length === 0) return [];
  let averages = [];
  let subArrSum = 0;
  let left = 0;

  for (let currEle = 0; currEle < numbers.length; currEle += 1) {
    subArrSum += numbers[currEle];

    if (currEle >= size - 1) {
      averages.push(subArrSum / size);
      subArrSum -= numbers[left];
      left += 1;
    }
  }

  return averages;
}



// Example test cases:
console.log(findAverages([], 2)); // []
console.log(findAverages([1, 2, 3, 4, 5, 6], 3)); // [ 2, 3, 4, 5 ]
console.log(findAverages([1, 2, 3, 4, 5], 2));    // [1.5, 2.5, 3.5, 4.5]
console.log(findAverages([10, 20, 30, 40, 50], 4)); // [ 25, 35 ]
console.log(findAverages([5, 5, 5, 5, 5], 1));      // [ 5, 5, 5, 5, 5 ]
console.log(findAverages([1, 3, 2, 6, -1, 4, 1, 8, 2], 5)); // [2.2, 2.8, 2.4, 3.6, 2.8]