function myReduce(array, func, initial) {
  let result;
  result = initial === undefined ? array[0] : initial;

  array.forEach(number => result = func(result, number));
  return result;
}

let smallest = (result, value) => (result <= value ? result : value);
let sum = (result, value) => result + value;

console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49