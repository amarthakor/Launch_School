/*
In this problem, you are provided with an ascending order array of integers, nums. Your task is to count the number of pairs in this array whose sum is greater than a given target value, target.

Constraints:

The array nums is sorted in ascending order.
No duplicate pairs should be counted. For instance, if nums contains [1, 2] and target is 2, then (1, 2) is a valid pair since 1 + 2 > 2. You shouldn't include (2, 1)

--- Problem
INPUT: ascending order array of integers, integer target `t`
OUTPUT: return integer

  Rules:
  - Given an array of sorted ints and an integer target `t`
  - Return an integer that represents
    - count the number of pairs in the array where
      - pairs sum is greater than target `t`
  - array `nums` is sorted in asc order; least -> greatest
  - No duplicate pairs should be counter
    - In this case, duplicate pairs refers to the same combination of index -elements in
      a different order
    - But pairs that are composed of the same elements at different indices are valid pairs
    - thus [1, 1] and [1, 1] at indices (0, 1) and (1, 2) would be two distinct pairs

Assumptions:
- How should we handle an empty array arg?
  - Return 0
- Will `t` ever be a negative number / 0?
  - `t` will always be > 0
- Will I ever be passed an incorrect data type?
  - Possibly, if so, return null
- What about missing arguments?
  - Always receieve exactly 2 args
- Will the ints in my array ever be 0 or negative?
  - Possibly, but never other number types, always whole integers

--- Examples
Given: [1, 2, 3, 4, 5], 6 -> 4
  1+2
  1+3
  1+4
  1+5
  2_3
  2+4
  2+5 1
  3+4 2
  3+5 3
  4+5 4 anchor /runner strategy

Given: [-1, 2], 1 ->
  -1 + 2 = 1; 1

Given: [1, 1, 1, 1], 1 -> 1
  Maybe filter subarr matches to see if any have the same 0 and 1st element
  If filter returns an array size > 0, theres a dup and dont count current pair

--- DS
- given an array
  - utilize anchor runner to find pairs that are > than my `t`
  - may need to create storage array for all pairs to check for dupes

--- Algorithm
1. Handle edge cases
2a. Set anchor and runner pointer to [0, 1] respectively
2b. Set pairCounts to 0
3. Find all valid pairs
- while anchor is less than < array length - 2
  - if nums[anchor] + nums[runner] > `t`
    - increment paircounts by 1
    - increment runner by 1
  - else if runner is < nums.length - 1
    - increment runner by 1
  - else
    - increment anchor by 1
    - reset runner to anchor + 1
4. Return valid pairs
*/

function countPairs(nums, t) {
  if (nums.length === 1) return 0;
  if (!Array.isArray(nums) || !Number.isInteger(t)) return null;
  let [anchor, runner, pairCount] = [0, 1, 0];

  while (anchor < nums.length - 1) {
    if (nums[anchor] + nums[runner] > t) {
      pairCount += 1;
      runner += 1;
    } else if (nums[anchor] + nums[runner] <= t && runner < nums.length - 1) {
      runner += 1;
    } else {
      anchor += 1;
      runner = anchor + 1;
    }
  }

  return pairCount;
}
// Example test cases:

console.log(countPairs([-1, 3], 1) === 1);    // 1
console.log(countPairs([1, 1, 1], 1));  // 1 but will probably return 3
console.log(countPairs(123, [1]) === null);
console.log(countPairs([], 23) === 0);

console.log(countPairs([1, 2, 3, 4, 5], 6) === 4);
// Pairs: (2, 5), (3, 4), (3, 5), (4, 5)

console.log(countPairs([1, 2, 3, 4, 5], 8) === 1);
// Pair: (4, 5)

console.log(countPairs([1, 3, 5, 7], 6) === 4);
// Pairs: (1, 7), (3, 5), (3, 7), (5, 7)

console.log(countPairs([1, 2, 3, 4], 5) === 2);
// Pairs: (2, 4), (3, 4)

console.log(countPairs([1, 2, 3, 4, 5], 10) === 0);
// No pairs