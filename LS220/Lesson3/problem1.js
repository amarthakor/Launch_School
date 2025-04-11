// Write a function `findPeakInTerrain` that finds any peak in a
// given hilly terrain. A peak is an element that is strictly
// greater than its neighbors. The first and last elements can
// be peaks if they are strictly greater than their single neighbor.
// Adjacent elements in the terrain cannot be equal.

// The function should take an array of integers as input,
// representing the elevations of spots in the terrain.
// It should return the index of any peak in the terrain.
// There is guaranteed to be at least one peak in the input array.

/*
--- Problem
INPUT: array of integers
OUTPUT: integer

  Rules:
    - Given arg is an array of integers that represents 'peaks'
      - A 'peak' is an element that is strictly greater than its neighbors
        - does this mean left and right elements only?
      - First and last ele can be peaks if they are bigger than their neighbor
      - Adjacenet eles in the terrain cannot be equal
        - Assuming that means no eles side to side will be the same
      
    - Given this, return an integer that represents the index of any
      peak in the terrain
    - There will always be at least one peak

ASsumptions:
- Will given arg always be a array?
  - Yes
- Will it always contain integers?
  -Yes
- Will the ints ever be negative or 0?
  - Always 1 or greater
- What about additional argS?
  - Only provided one arg
- If array is 1 element long, is the ele itself the peak?
  - Yes, in this case its index is 0 so return 0
- How should we handle empty arrays?
  - Return null since there are no peaks

--- Examples
[1, 2, 1] -> return 1 (index)
  - 1 adjacent 2 not peak
  - 2 adjacent to 1 and 1 is peak
  - 1 adjacent 2 not peak
  -> 2 is a peak
  -> index of 2 is 1

[1, 3, 4, 1] -> return 2
- 1 next to 3 not peak
- 3 next to 1 and 4 not peak
- 4 next to 3 and 1 PEAK
- 1 next to 4 not peak
-> 4 index at 2
-> 2

[1, 3, 2, 1, 5, 4] -> 1 or 4 (two peaks)
- pick ele 2 at index 2
  - left is greater, right is smaller
  - thus lets eliminate right halff
- pick new middle
  - 3 at idx 1
  - left and right are shorter
  - peak has been found

[1, 2, 3, 4, 5, 7, 3] -> return index 5
- pick ele 4 at index 3 middle element
- left is shorter, right is greater
- eleimiante left half
- [4, 5, 7, 4]
  - new middle is 5 at index 4
  - left is shorter right is taller
- repeat new mid
  [5, 7, 4]
    - new middle is 7
    - 7 is peak
    - return idnex of 7

[3, 2, 1] -> 0
mid peak -> 2, mid index = 1
3 greater 1 is lesser
reassign right to mid - 1 -> 0
left = 0, right = 0, new mid = 0
3 is greater than its left and right -> false
--- DS
- Given array
- Can use BS to check array, but given array is not sorted
- sorting array is O(N) time complex
- BS is logN
- need to apply BS w/o sorting elements

--- Algorithim
1. Return null if array is empty
2. If array size is 1, return 0
3. Set left to 0 and right to array size - 1
4. Find index of a peak
- while left is <= right
  - find mid index (left + right  / 2 floor)
  - if middle peak is greater than peak on its left and right
    - return mid (this is index)
  - else if peak on the left is greater than middle peak
    - reassign right to mid - 1
  - else
    reassign left to mid  + 1
*/

function findPeakInTerrain(peaks) {
  if (peaks.length === 0) return null;
  if (peaks.length === 1) return 0;

  let [left, right] = [0, peaks.length - 1];

  while (left <= right) {
    let mid = Math.floor((left + right) / 2);
    if (mid === 0 && peaks[mid] > peaks[mid + 1]) {
      return 0;
    } else if (mid === peaks.length - 1 && peaks[mid] > peaks[mid - 1]) {
      return peaks.length - 1;
    } else if (peaks[mid] > peaks[mid - 1] && peaks[mid] > peaks[mid + 1]) {
      return mid;
    } else if (peaks[mid] < peaks[mid - 1]) {
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }
}

// Example:
// Input: terrain = [1, 3, 2, 1, 4, 5]
// Output: 1 or 5
// Explanation: Both index 1 (elevation 3) and index 5
//              (elevation 5) are peaks.

// function findPeakInTerrain(terrain) {
//   // implementation goes here
// }

console.log(findPeakInTerrain([1, 2, 1]) === 1);
console.log(findPeakInTerrain([1, 3, 4, 1]) === 2);
console.log(findPeakInTerrain([3, 2, 1]) === 0);
console.log(findPeakInTerrain([1, 2, 3]) === 2);
console.log([1, 4].includes(findPeakInTerrain([1, 3, 2, 1, 5, 4])));
console.log(findPeakInTerrain([1, 2, 3, 4, 5, 7, 3]) === 5);
console.log(findPeakInTerrain([1, 2, 3, 4, 3, 2, 1]) === 3);
console.log([0, 8].includes(findPeakInTerrain([5, 4, 3, 2, 1, 2, 3, 4, 5])));
console.log(findPeakInTerrain([1, 2, 3, 4, 5, 4, 3, 2, 1]) === 4);
console.log(findPeakInTerrain([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]) === 0);
console.log(findPeakInTerrain([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) === 9);

// All test cases should log true