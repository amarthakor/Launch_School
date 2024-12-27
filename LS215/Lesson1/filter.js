function myFilter(array, func) {
  let newArray = [];

  array.forEach(number => {
    if (func(number)) newArray.push(number)
  });

  return newArray;
}

let numbers = [1, 2, 3, 4, 5, 6];
let getEvenNumbers = (num => { if (num % 2 === 0) return true });

console.log(myFilter(numbers, getEvenNumbers));

// bonus examples

function multiplesOfThreeOrFive(values) {
  return myFilter(values, isMultipleofThreeOrFive);
}

function isMultipleofThreeOrFive(value) {
  return value % 5 === 0 || value % 3 === 0;
}

console.log(multiplesOfThreeOrFive([1, 3, 5, 7, 11, 18, 16, 15]));