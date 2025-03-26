/*
Algo:
- Iterate through the array `n` times
- Set a tracker, swapped, to false
- For each element in the array
  - Compare the current ele to the next ele
    - If ele1 > ele2
      - swap them
      - set swapped to true
    - else move onto the next element
- Finally, return the sorted array
*/

function bubbleSort(arr) {
  let swapped = true;

  while (swapped) {
    swapped = false;

    arr.forEach((num, idx) => {
      if (num > arr[idx + 1]) {
        [arr[idx], arr[idx + 1]] = [arr[idx + 1], arr[idx]];
        swapped = true;
      }
    });
  }

  return arr;
}

console.log(bubbleSort([2, 1, 3, 5])); // [1, 2, 3, 5]
const array = [5, 3, 8, 7, 2];
console.log(bubbleSort(array)); // Output: [2, 3, 5, 7, 8]