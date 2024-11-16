const DIGITS = { '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6,
                 '7': 7, '8': 8, '9': 9 };

function stringToInteger(strNum) {
  let number = 0;
  let placeHolder = strNum.length - 1;

  for (let idx = 0; idx < strNum.length; idx += 1) {
    number += ((Math.pow(10, placeHolder)) * DIGITS[strNum[idx]]);
    placeHolder -= 1;
  }

  return number;
}


console.log(stringToInteger('4321'));      // 4321
console.log(stringToInteger('570'));       // 570