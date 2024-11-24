function maxRotation(number) {
  let digits = String(number).split('');

  for (let idx = 0; idx < digits.length - 1; idx += 1) {
    digits = digits.slice(0, idx).concat(digits.slice(idx + 1), digits[idx]);
  }

  return parseInt(digits.join(''), 10);
}


console.log(maxRotation(735291));          // 321579
console.log(maxRotation(3));                    // 3
console.log(maxRotation(35));                  // 53
console.log(maxRotation(105));                 // 15
console.log(maxRotation(8703529146));  // 7321609845