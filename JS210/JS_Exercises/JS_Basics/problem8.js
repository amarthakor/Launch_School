const DIGITS = { '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6,
  '7': 7, '8': 8, '9': 9 };

function stringToSignedInteger(strNum) {
  let newNum;

  if (strNum[0] === '+' || strNum[0] === '-') {
    newNum = strNum.substring(1, strNum.length);
  } else {
    newNum = strNum;
  }

  let number = 0;
  let placeHolder = newNum.length - 1;

  for (let idx = 0; idx < newNum.length; idx += 1) {
    number += ((Math.pow(10, placeHolder)) * DIGITS[newNum[idx]]);
    placeHolder -= 1;
  }

  return (strNum[0] === '-') ? -newNum : newNum;
}

console.log(stringToSignedInteger('4321'));      // 4321
console.log(stringToSignedInteger('-570'));      // -570
console.log(stringToSignedInteger('+100'));      // 100