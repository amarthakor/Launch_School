// Create a function named sum that takes the same three arguments as average, 
// and returns the sum of the three arguments. Now modify average to call the
//  sum function with those three arguments and use the return value to
//   calculate the average.

function average(a, b, c) {
  return (sum(a, b, c) / 3);
}

function sum(a, b, c) {
  return (a + b + c);
}

let result = average(5, 5, 5);
console.log(result);