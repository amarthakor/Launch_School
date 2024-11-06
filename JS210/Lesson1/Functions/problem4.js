// We should make the same changes to the sum function so we can continue to use it from the average function. Since we've already written that functionality in average, we can just move it from there to sum. Move everything from average into sum, except for the final return statement. The sum function should return the total, and average should call the sum function with the same values, then divide the return value by the array length, and return it.

// As before, call average with an array of five numbers and log the result.


function average(numbers) {
  return sum(numbers) / numbers.length;
}

function sum(numbers) {
  let total = 0;

  for (let idx = 0; idx < numbers.length; idx += 1) {
    total += numbers[idx];
  }

  return total;
}

let result = average([5, 5, 5, 5, 5]);
console.log(result); // should be 15
result = average([5, 10, 15, 20, 25]);
console.log(result); // should be 15