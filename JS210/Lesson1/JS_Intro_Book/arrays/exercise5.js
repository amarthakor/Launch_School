let things = [1, 'a', '1', 3, NaN, 3.1415, -4, null, false];

function findIntegers(array) {
  let newArr = []
  array.forEach(function(ele) {
    if (Number.isInteger(ele)) {
      newArr.push(ele);
    }
  });

  return newArr
}

let integers = findIntegers(things);
console.log(integers); // => [1, 3, -4]