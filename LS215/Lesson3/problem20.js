// 3.  Array Problem:
//    Write a function that takes an array of integers and returns a new array where each element is replaced by the product of all other elements in the original array. Do not use the division operation.

// javascript

function findProduct(numbers, currentIdx) {
  let product = 1;

  numbers.forEach((num, idx) => {
    if (currentIdx !== idx) product *= num;
  });

  return product;
}

function productOfOthers(numbers) {
  if (!Array.isArray(numbers)) return null;
  return numbers.map((_, idx) => {
    return findProduct(numbers, idx);
  });
}

console.log(JSON.stringify(productOfOthers([-1, 2, -3, 4])) === JSON.stringify([-24, 12, -8, 6]));
console.log(JSON.stringify(productOfOthers([0.5, 2, 3])) === JSON.stringify([6, 1.5, 1]));
console.log(JSON.stringify(productOfOthers([-1, 0, 2, -3])) === JSON.stringify([0, 6, 0, 0]));
console.log(JSON.stringify(productOfOthers([0, 0, 1, 2])) === JSON.stringify([0, 0, 0, 0]));


console.log(productOfOthers(1)); // null
console.log(productOfOthers([])); // [];
console.log(JSON.stringify(productOfOthers([1, 2, 3, 4])) === JSON.stringify([24, 12, 8, 6]));
console.log(JSON.stringify(productOfOthers([1, 1, 1, 1])) === JSON.stringify([1, 1, 1, 1]));
console.log(JSON.stringify(productOfOthers([2, 3, 4, 5])) === JSON.stringify([60, 40, 30, 24]));
console.log(JSON.stringify(productOfOthers([0, 1, 2, 3])) === JSON.stringify([6, 0, 0, 0]));
console.log(JSON.stringify(productOfOthers([10])) === JSON.stringify([1]));