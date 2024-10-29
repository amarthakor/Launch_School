let array = [3, 5, 7];

function sumOfSquares(arr) {
  let newArr = arr.map(num => num * num);
  return newArr.reduce((accumulator, element) => accumulator + element, 0);
}

console.log(sumOfSquares(array)); // => 83