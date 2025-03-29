// Implement a function `findRange` that takes in an array of
// integers sorted in ascending order. The function should
// return an array containing the starting and ending
// positions of the number 3 within the array. If the number 3
// is not found, return [-1, -1].

/*
Algorithm:
** HELPER find left most index of target num **
  - set left to 0, right to array size - 1
  - set leftMostIdx to -1
  - while left <= right
    - set mid to (left + right) / 2 # math floor
    - if array[mid] === target number (3)
      reassign `leftMostIdx` to mid
      reassign right to mid - 1
    - else if array[mid] < 3
      reassign left to mid + 1
    - else
      reassign right to mid -1
  - return leftmost

** HELPER find right most index of target num **
  - set left to 0, right to arr size - 1
  - set rightMostIdx to -1
  - while left <= right
    - set mid to (left + right) / 2 # math floor
    - if array[mid] === target number (3)
      reassign `rightmostIdx` to mid
      reassign left to mid - 1
    - else if array[mid] < 3
      reassign left to mid + 1
    - else
      reassign right to mid -1
  - return rightmost

main function
- return [leftMostHELPER, rightmostHELPER]
*/
function findRange(arr, target) {
  return [findLeftMost(arr, target), findRightMost(arr, target)];
}

function findLeftMost(arr, target) {
  let left = 0;
  let right = arr.length - 1
  let leftMostIdx = -1;

  while (left <= right) {
    let mid = Math.floor((left + right) / 2);
    if (arr[mid] === target) {
      leftMostIdx = mid;
      right = mid - 1;
    } else if (arr[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return leftMostIdx;
}

function findRightMost(arr, target) {
  let left = 0;
  let right = arr.length - 1
  let rightMostIdx = -1;

  while (left <= right) {
    let mid = Math.floor((left + right) / 2);
    if (arr[mid] === target) {
      rightMostIdx = mid;
      left = mid + 1;
    } else if (arr[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return rightMostIdx;
}



// Example:
let nums = [1, 2, 3, 3, 3, 3, 3, 4, 5]
console.log(findRange(nums, 3)); // Output: [2, 6]

// Example:
let nums1 = [1, 2, 5, 5, 6, 9, 10]
console.log(findRange(nums1, 3)); // Output: [-1, -1]