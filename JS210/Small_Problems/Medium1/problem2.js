function rotateRightmostDigits(number, digit) {
  if (digit === 1) return number;

  number = number.toString().split('');
  let rotatedDigit = number.slice(-digit)[0];

  number = number.slice(0, -digit).concat(number.slice(-digit + 1));
  number.push(rotatedDigit);
  return parseInt(number.join(''), 10);
}



console.log(rotateRightmostDigits(735291, 1));      // 735291
console.log(rotateRightmostDigits(735291, 2));      // 735219
console.log(rotateRightmostDigits(735291, 3));      // 735912
console.log(rotateRightmostDigits(735291, 4));      // 732915
console.log(rotateRightmostDigits(735291, 5));      // 752913
console.log(rotateRightmostDigits(735291, 6));      // 352917