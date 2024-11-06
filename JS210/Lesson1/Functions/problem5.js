// Create an array named temperatures and store five temperature values in it. Find the average temperature by passing the array to the average function and log the result.

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

let temperatures = [5, 10, 15, 20, 25];
console.log(average(temperatures));