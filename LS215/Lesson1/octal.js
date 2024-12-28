// convert string argument into array of integer digits
// declare var to represent decimal number and init to 0
// delcare var 'power' and set to size of arr of digits - 1
// iterate over array of digs
//    for each digit multiply by 8 to power of 'power' and increment total
// reutrn total

function octalToDecimal(strNum) {
  let digits = convertStrToNumArray(strNum);
  let decimal = 0;
  let power = digits.length - 1;

  digits.forEach(num => {
    decimal += num * (8 ** power);
    power -= 1;
  });

  return decimal;
}


function convertStrToNumArray(strNum) {
  let arrayOfDigits = strNum.split('');
  return arrayOfDigits.map(num => Number(num));
}

console.log(octalToDecimal('1'));           // 1
console.log(octalToDecimal('10'));          // 8
console.log(octalToDecimal('130'));         // 88
console.log(octalToDecimal('17'));          // 15
console.log(octalToDecimal('2047'));        // 1063
console.log(octalToDecimal('011'));         // 9