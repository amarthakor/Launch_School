let arr = ['a', 'abcd', 'abcde', 'abc', 'ab'];

function oddLengths(array) {
  let newArr = array.filter(word => word.length % 2 !== 0)
  return newArr.map(word => word.length);
}

console.log(oddLengths(arr)); // => [1, 5, 3]