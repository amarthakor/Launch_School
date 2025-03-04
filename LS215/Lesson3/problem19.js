// 2.  Number Problem:
//    Create a function that takes an integer as an argument and returns the sum of all prime numbers up to and including that integer. If the input is less than 2, return 0.



// javascript

function isPrime(num) {
  for (let factor = 2; factor < num; factor += 1) {
    if (num % factor === 0) return false;
  }

  return true;
}

function sumOfPrimes(number) {
  if (!Number.isInteger(number)) return null;
  if (number < 2) return 0;

  let primeTotal = 0;

  for (let num = 2; num <= number; num += 1) {
    if (isPrime(num)) primeTotal += num;
  }

  return primeTotal;
}
console.log(sumOfPrimes([]));
console.log(sumOfPrimes(true));
console.log(sumOfPrimes('1'));
console.log(sumOfPrimes(1.1));
console.log(sumOfPrimes(10) === 17); // 2 + 3 + 5 + 7 = 17
console.log(sumOfPrimes(5) === 10); // 2 + 3 + 5 = 10
console.log(sumOfPrimes(1) === 0);
console.log(sumOfPrimes(0) === 0);
console.log(sumOfPrimes(20) === 77); // 2 + 3 + 5 + 7 + 11 + 13 + 17 + 19 = 77

// Additional edge cases
console.log(sumOfPrimes(-5) === 0);
console.log(sumOfPrimes(2) === 2);
console.log(sumOfPrimes(3) === 5);
console.log(sumOfPrimes(100) === 1060);
console.log(sumOfPrimes(Infinity) === null);
console.log(sumOfPrimes(NaN) === null);
console.log(sumOfPrimes() === null);
console.log(sumOfPrimes(null) === null);
console.log(sumOfPrimes(undefined) === null);