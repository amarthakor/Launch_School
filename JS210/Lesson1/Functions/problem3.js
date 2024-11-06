// Create a variable named total with an initial value of 0 at the start of the
//  average function. Use a for loop to iterate over all the elements in the array.
// With each iteration, add the element's value to the total. When the loop
// finishes, return the total divided by the array's length. Call average
// with an array of five numbers and log the result.

function average(numbers) {
  let total = 0;
  for (let idx = 0; idx < numbers.length; idx += 1) {
    total += numbers[idx];
  }
  return total / numbers.length;
}

let result = average([5, 5, 5, 5, 5]);
console.log(result); // should log 5
result = average([5, 10, 15, 20, 25]);
console.log(result); // should log 15