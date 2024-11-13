function arraysEqual(arr1, arr2) {
  if (arr1.length !== arr2.length) return console.log(false);
  let equal = true;

  for (let idx = 0; idx < arr1.length; idx += 1) {
    if (arr1[idx] !== arr2[idx]) {
      equal = false;
    }
  }

  return equal;
}

console.log(arraysEqual([1], [1]) === true);         // true
arraysEqual([1], [2]);                               // false
arraysEqual([1, 2], [1, 2, 3]);                      // false
arraysEqual([1, 'hi', true], [1, 'hi', true]);       // true
arraysEqual([1, 'hi', true], [1, 'hi', false]);      // false
arraysEqual([1, 'hi', true], [1, 'hello', true]);    // false
arraysEqual([1, 'hi', true], [2, 'hi', true]);       // false