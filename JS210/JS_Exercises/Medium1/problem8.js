function productOfSums(array1, array2) {
  let result = total(array1) * total(array2);
  return result;
}

function total(numbers) {
  let sum;

  for (let i = 0; i < numbers.length; i += 1) {
    sum += numbers[i];
  }

  sum; // need to change this line to read 'return sum;'
}

// total function doesn't return anything, implicitly returns undefined,
// thus productOfSums function doesnt have actual numbers to work with thus we get NaN