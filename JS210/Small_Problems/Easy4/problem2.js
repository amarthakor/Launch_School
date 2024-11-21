function union(arr1, arr2) {
  newArr = [];
  newArr = newArr.concat(arr1, arr2);

  return newArr.filter((num, idx) => newArr.indexOf(num) === idx);
}

console.log(union([1, 3, 5], [3, 6, 9]));    // [1, 3, 5, 6, 9])