// Imagine a series of vertical barriers arranged in a straight
// line at equal distances across a flat field.
// These barriers have different heights. After a rainstorm,
// water collects between the barriers, forming reservoirs.
// Your task is to determine the maximum volume of rainwater
// that can be captured between any two barriers, without
// the water spilling over the tops of those two barriers.

// Write a function `maxRainwater` that takes an array of
// barrier `heights` and calculates the maximum volume
// of rainwater that can be harvested between any two barriers.

// The array `heights` represents the height of each barrier,
// where `heights[i]` is the height of the i-th barrier.
// The distance between each barrier is uniform.

// The input array will contain at least 2 values.

/*
--- Problem
input - array of heights -> integers
output - max volume -> integer

  - Given array represents heights of barriers
  - Output represents the max amount of volume between any two barriers
  - Input woll contain at least 2 values
  - Max contains vol of water without any water spilling over the tops of two barriers


Assumptions:
- Will my give arr always contain integerS?
  - Yes
- Will they always be positive ints or could they be ngative / 0?
  - Always positive values
- Will I ever be given a non-arr arg?
  - POssibly, in which ase return null
- What about additional arguments/
  - Only one arg will be given

--- Examples
[1, 2, 1]
-> 2
- looking for largest vol between any two pillars
- distance between first pillar and last is 2
- max height withou spillage is 1
- 2 * 1 = 2
-> 2

- [2, 3, 4, 2] -> 6
- distance between 2 and 2 is 3
- max height is 2 w/o spillage 
- 3 * 2 = 6
-> 6

- [2, 9, 5, 10, 5, 6]) -> 24
- distance between 2 and 6 is 5
- max height is 2 w/o spillage
- 5 * 2 = 10
- distance between 9 and 6 is 4
- max height between 9 and 6 is 6
- 4 * 6 = 24 ***
- 5..6 max ditance = 3
- max height = 5 
- 3 * 5 = 15
- 10..6 = 2
- max height = 6
- 2*6 =12

- [5, 4, 3, 2, 9, 10, 3, 4, 5]) === 40);
  - 5..5 = 8
    - max height = 5
    - 8 * 5 = 40
  [ 2, 3, 3, 4, 4, 5, 5, 9, 10]
  
--- DS
- given array
- iterate over array
- use two pointer start/end strategy to maintain O(N) time complex

--- Algorithm
1. If length of arr = 2, return miniumum between arr[0] and arr[2]
2. Set start to 0, end to arr length - 1
3. Set maxvol to 0
4. Find maxVol
- while start is less than end
  - reassign maxVol to end - start * the smaller of the two heights if this val
    is bigger than maxVols current value
  - if startpoint is less than endpoint
    - increment startpoint by +1
  - else if endpoint is less than startpoint
    - decrement endpoint by -1
  - else they are the same
    - increment startpoint by + 1
5. Return maxVol

- [2, 3, 4, 2] -> 6
- amxVol = 0, start = 0, end = 3
  - maxVol = 3 - 0 * 2 = 6
  - 2 === 2, thus start = 1
- maxVol = 6, 3 - 1 * 2 = 4
  - dont reassign maxVol
  - start is > than end ( 3 > 2)
    - decrement end
    - end = index 2 (4)
  - maxVol = 6, 2 - 1 * 3 = 3
    - dont reassign maxVol
    - end is > start
    - start + 1
    - start = index 2 (4)
- end iteration
return maxvol -> 6
*/

function maxRainwater(heights) {
  if (heights.length === 2) return Math.min(heights[0], heights[1]);
  let [start, maxVol, end] = [0, 0, heights.length - 1];

  while (start < end) {
    let currVol = (end - start) * Math.min(heights[start], heights[end]);
    if (currVol > maxVol) maxVol = currVol;
    if (heights[start] < heights[end]) {
      start += 1;
    } else if (heights[start] > heights[end]) {
      end -= 1;
    } else {
      start += 1;
    }
  }

  return maxVol;
}

// Example:
// Input: [1, 2, 1]
// Output: 2
// Explanation: The distance between the first and
// third barrier is 2, and the height is 1, so
// the maximum amount of rainfall is 2 * 1 = 2

//   |    =>    |
// |_|_|      |*|*|

// Example:
// Input: [2, 3, 4, 2]
// Output: 6
// Explanation: The distance between the first and
// fourth barrier is 3, and the height is 2, so the
// maximum amount of rainfall is 3 * 2 = 6

//     |            |
//   | |    =>    | |
// | | | |      |*|*|*|
// |_|_|_|      |*|*|*|

console.log(maxRainwater([1, 1]) === 1);
console.log(maxRainwater([1, 3]) === 1);
console.log(maxRainwater([1, 2, 1]) === 2);
console.log(maxRainwater([2, 3, 4, 2]) === 6);
console.log(maxRainwater([2, 2, 2, 2, 2]) === 8);
console.log(maxRainwater([2, 9, 5, 10, 5, 6]) === 24);
console.log(maxRainwater([5, 4, 3, 2, 9, 10, 3, 4, 5]) === 40);
console.log(maxRainwater([3, 1, 2, 5, 2, 4, 2, 5, 6, 1, 5, 3, 2, 3, 4, 1, 2]) === 44);
console.log(maxRainwater([2, 2, 13, 9, 1, 15, 2, 5, 9, 7, 5, 3, 6, 3, 4, 1, 4, 5]) === 75);

// All test cases should log true