let evenOrOdd = [];

let myArray = [
  1, 3, 6, 11,
  4, 2, 4, 9,
  17, 16, 0,
];

console.log(myArray.map(function(num) {
  if (num % 2 === 0) {
    return 'even';
  } else {
    return 'odd';
  }
}));
