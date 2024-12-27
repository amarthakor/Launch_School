function myForEach(array, func) {
  array.reduce(func);
}

let totalSum;
let getTotalSum = ((acc, currentVal) => totalSum = acc + currentVal);

myForEach([1, 2, 3, 4, 5], getTotalSum);
console.log(totalSum);