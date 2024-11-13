function twice(num) {
  if (num.toString().length % 2 === 1) return num * 2;

  let strNum = num.toString();

  let firstHalf = strNum.length > 2 ? strNum.length / 2 - 1 : 1;
  let secondHalf = strNum.length > 2 ? strNum.length / 2: 1;
  let strEnd = strNum.length > 2 ? strNum.length - 1 : 2;


  if (strNum.slice(0, firstHalf) === strNum.slice(secondHalf, strEnd)) {
    return num;
  } else {
    return num * 2;
  }
}

twice(37);          // 74
twice(44);          // 44
twice(334433);      // 668866
twice(444);         // 888
twice(107);         // 214
twice(103103);      // 103103
twice(3333);        // 3333
twice(7676);        // 7676