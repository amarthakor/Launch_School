function halvsies(arr) {
  let midIdx = arr.length / 2;

  if (arr.length % 2 === 0) {
    return [arr.slice(0, midIdx), arr.slice(midIdx)];
  } else {
    return [arr.slice(0, midIdx + 1), arr.slice(midIdx + 1)];
  }
}



console.log(halvsies([1, 2, 3, 4]));       // [[1, 2], [3, 4]]
console.log(halvsies([1, 5, 2, 4, 3]));    // [[1, 5, 2], [4, 3]]
console.log(halvsies([5]));                // [[5], []]
console.log(halvsies([]));                 // [[], []]