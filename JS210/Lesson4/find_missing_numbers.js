function missing(arr) {
  if (arr.length === 1) return [];

  let missingArr = []
  let min = arr[0];
  let max = arr[arr.length - 1];
  
  for (min; min < max; min += 1) {
    if (!arr.includes(min)) {
      missingArr.push(min);
    }
  }

  return missingArr;
}


console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []