// Write a function that determines whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

function isPalindromeNumber(num) {
  if (!Number.isInteger(num)) return null;
  return String(num).split('').reverse().join('') === String(num);
}

console.log(isPalindromeNumber(121)); // true
console.log(isPalindromeNumber(123)); // false
console.log(isPalindromeNumber(0) === true);
console.log(isPalindromeNumber(11) === true);
console.log(isPalindromeNumber(121) === true);
console.log(isPalindromeNumber(12321) === true);
console.log(isPalindromeNumber(123) === false);
console.log(isPalindromeNumber(12345) === false);
console.log(isPalindromeNumber(1000001) === true);
console.log(isPalindromeNumber(100001) === true);
console.log(isPalindromeNumber(9) === true);
console.log(isPalindromeNumber(10) === false);
console.log(isPalindromeNumber(-121) === false);
console.log(isPalindromeNumber(1234554321) === true);
console.log(isPalindromeNumber(1234564321) === false);
console.log(isPalindromeNumber(1.1) === null);
console.log(isPalindromeNumber(NaN) === null);
console.log(isPalindromeNumber(Infinity) === null);
console.log(isPalindromeNumber('121') === null);
console.log(isPalindromeNumber([]) === null);
console.log(isPalindromeNumber({}) === null);