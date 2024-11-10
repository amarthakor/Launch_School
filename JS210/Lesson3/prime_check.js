function isPrime(number) {
  if (number === 1 || number === 0) return console.log(false);

  for (let idx = 2; idx < number; idx += 1) {
    if (number % idx === 0) {
      return console.log(false);
    }
  }

  return console.log(true);
}

isPrime(1);   // false
isPrime(2);   // true
isPrime(3);   // true
isPrime(43);  // true
isPrime(55);  // false
isPrime(0);   // false