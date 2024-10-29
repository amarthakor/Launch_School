let myArray = [
  [1, 3, 6, 11],
  [4, 2, 4],
  [9, 17, 16, 0],
];

for (idx = 0; idx < myArray.length; idx += 1) {
  myArray[idx].forEach(function(num) {
    if (num % 2 === 0)
      console.log(num);
  });
}