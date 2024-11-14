function reverse(inputForReversal) {
  let reverseArr = []

  for (let idx = inputForReversal.length - 1; idx >= 0; idx -= 1) {
    reverseArr.push(inputForReversal[idx]);
  }

  return (typeof(reverseArr[0]) === 'string') ? reverseArr.join('') : reverseArr;
}

console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []

const array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]