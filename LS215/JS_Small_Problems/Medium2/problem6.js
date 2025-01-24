// Write a function that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.



function sumSquareDifference(num) {
  let numbers = Array.from(Array(num), (_, idx) => idx + 1);
  let sumTotal = 0;
  let squareTotal = 0;

  numbers.forEach(number => sumTotal += number);
  numbers.forEach(number => squareTotal += number ** 2);

  sumTotal = sumTotal ** 2
  return sumTotal - squareTotal;
}



// Examples:

console.log(sumSquareDifference(3));      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
console.log(sumSquareDifference(10));     // 2640
console.log(sumSquareDifference(1));      // 0
console.log(sumSquareDifference(100));    // 25164150