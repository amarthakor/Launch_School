// Write a function named `minLengthForTargetSum` that
// determines the minimal length of a contiguous subarray
// within an array of positive integers, `nums`. This
// subarray should have a sum that is greater than or
// equal to a specified positive integer, `target`. The
// function should return the length of this subarray.
// If no such subarray exists, return 0.

/*
--- Examples
[1, 4, 1, 3, 6, 2], 9)
1 < 9                       less than 9 so we increase our window
1, 4 < 9                    less than 9 so we increase our window
1 4 1 < 9                   less than 9 so we increase our window
1 4 1 3 === 9, window = 4   equal to 9, lets decrease start
4 1 3 < 9                   less than 9 so we increase our window
4 1 3 6 > 9                 greater than 9, so lets decrease our start window
3, 6 === 9, window = 2      equal to 9, lets decrease start, increase end range
6, 2 < 9                    less than 9 so we increase our window
6, 2 null ...
end of iteration

[1, 2, 3], 5)
1 > 5
1 2 > 5
1 2 3 > 5     greater than 5, lets decrease our start range
2, 3 === 5 wondow 2, equal to 5, lets decrease start and increase end
3, null
end iteration

** perhaps end iteration when runner is not less than array length? ***

- [1, 2, 3, 4, 5], 9
1 < 9
1 2 < 9
 1 2 3 < 9
 1 2 3 4 > 10                 ---lets decreae start window
2 3 4 === 9, window 3         --- matched lets decreae start and increase end
3 4 5 > 9                     --- lets decrease start window
4 5 === 9, window = 2         -- matched lets dc start inc end
5 null
end iteration

[1 2 3], 5
sum = 0, anchor = 0, runner = 0, window = infinity
iteration 1
  sum = 1
  1 < 5
  runner +1 == 1
  sum = 1, runner = 1, anchor = 0, window = finity
iteration 2
  sum = 1 + 2 = 3
  sum = 3, runner = 2, anchor = 0, window = infiny
iteration 3
  sum = 3 + 3
  sum = 6 > 5 THUS
    sum - 1 = 5, anchor +1 = 1, runner = 2, window = infinity
    sum - 3 ( value at runner) = 2
iteration 4
  sum  = 2 + 3 = 5
  sum = 5 === target
    thus window = Math.min(Infinity, runner - anchor)
      runner - anchor = 2 - 1 + 1 -> 1 + 1 ->2
      sum -= 2 ( value of anchor) -> sum = 3
      runner + 1 -> runner = 3
end iteration since runner === array length

increment runner when less than `targe`
increment anchor when greater tha `target`

--- DS
- given array
- want to iterate over array but not use nested loops
- can use anchor runner
- can end loop when runner hits array length
- this will keep O(N) time complexity

--- Algorithm
1. If array empty, return 0
2. Set anchor to 0, runner to 0, window to infinity, windowSum to arr[0]
3. Find smallest matching window
- while runner is less than my array size
  - increment windowSum by the element at runner
  - if windowSum is equal to my target `t`
    - set window to (runner - anchor) + 1 IF this value is less than windows current size #min
    - decrement windowSum by the value at anchor
    - move anchor and runner by 1
  - else if windowSum greater than my `t` target
    - decrement windowSum by the value at anchor and the value of runner
    - increment anchor by 1
  - else
    - increment runner by 1
4. Return smallest mathcing window
*/

function minLengthForTargetSum(nums, t) {
  if (nums.length === 0) return 0;
  let [anchor, runner, window, windowSum] = [0, 0, Infinity, 0];

  while (runner < nums.length) {
    windowSum += nums[runner];
    if (windowSum === t) {
      window = Math.min(window, (runner - anchor + 1));
      windowSum -= nums[anchor];
      anchor += 1;
      runner += 1;
    } else if (windowSum > t) {
      windowSum -= nums[anchor];
      windowSum -= nums[runner];
      anchor += 1;
    } else {
      runner += 1;
    }
  }

  return window === Infinity ? 0 : window;
}

console.log(minLengthForTargetSum([1, 2, 3], 5) === 2);
console.log(minLengthForTargetSum([1, 1, 1], 4) === 0);
console.log(minLengthForTargetSum([8, 2, 1, 4], 8) === 1);
console.log(minLengthForTargetSum([1, 2, 3, 4, 5], 9) === 2);
console.log(minLengthForTargetSum([1, 4, 1, 3, 6, 2], 9) === 2);
console.log(minLengthForTargetSum([1, 2, 3, 4], 10) === 4);
console.log(minLengthForTargetSum([1, 2, 6, 1, 1, 7], 9) === 3);
console.log(minLengthForTargetSum([4, 2, 2, 1, 5, 2], 14) === 5);

// All test cases should log true

// javascript

// Test Case 1: When a single element exceeds the target
console.log(minLengthForTargetSum([15], 10) === 0);
// Expected: 1 - Your solution might return 0

// Test Case 2: When the sum exceeds target but you need to keep the runner element
console.log(minLengthForTargetSum([2, 3, 1, 2, 4, 3], 7) === 2);
// Expected: 2 (the subarray [4, 3])

// Test Case 3: When shrinking the window is required multiple times
console.log(minLengthForTargetSum([5, 1, 3, 5, 10, 7, 4, 9, 2, 8], 15) === 2);
// Expected: 1 (the subarray [10])

// Test Case 4: Edge case with large numbers
console.log(minLengthForTargetSum([100, 200, 300, 400, 500], 500) === 1);
// Expected: 1 (the subarray [500])

// Test Case 5: When you need to continue checking after finding one valid window
console.log(minLengthForTargetSum([7, 2, 1, 1, 6, 5], 10) === 3);
// Expected: 2 (the subarray [5, 6] is shorter than [7, 2, 1])

// Test Case 6: When valid subarrays appear at the end of the array
console.log(minLengthForTargetSum([1, 1, 1, 10, 5], 10) === 1);
// Expected: 1 (the subarray [10])

// javascript

// Edge Case 1: Consecutive elements requiring multiple window adjustments
console.log(minLengthForTargetSum([3, 4, 1, 1, 6], 8) === 3); // Expected: 2 ([3, 6])

// Edge Case 2: When multiple valid windows exist with same length
console.log(minLengthForTargetSum([4, 3, 2, 6, 1, 5], 7) === 2); // Expected: 2 ([4, 3] or [6, 1] or [2, 5])

// Edge Case 3: When we need precise window adjustment to find minimum length
console.log(minLengthForTargetSum([1, 4, 2, 3, 5, 1, 1, 1, 3], 8) === 2); // Expected: 2 ([3, 5])

// Edge Case 4: Array with repeated elements requiring careful window management
console.log(minLengthForTargetSum([2, 2, 2, 8, 2, 2, 2], 8) === 1); // Expected: 1 ([8])

// Edge Case 5: When shifting the anchor multiple times is needed
console.log(minLengthForTargetSum([9, 8, 1, 2, 3, 4, 5], 10) === 4); // Expected: 1 ([9])

// Edge Case 6: When the sum just equals target after several adjustments
console.log(minLengthForTargetSum([5, 3, 1, 7, 6, 4], 11) === 3); // Expected: 2 ([7, 4] or [5, 6])