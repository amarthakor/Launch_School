// build digit unique helper method
// check if odd and multiple of 7 and unique number
// if true return num
// if not increment by 1 and recheck
// if number is greater than 9876543201 return invalid possible conditio


function featured(num) {
  if (validMultipleOfSeven(num) && uniqueNumber(num)) num += 1;
  if (num > 9876543200) return "There is no possible number that fulfills those reqs."

  while (num <= 9876543201) {
    if (validMultipleOfSeven(num) && uniqueNumber(num)) return num;
    num += 1;
  }
}

function validMultipleOfSeven(num) {
  if (num % 7 === 0 && num % 2 === 1) return true;
  return false;
}

function uniqueNumber(num) {
  num = num.toString().split('');
  let digits = [];

  for (let idx = 0; idx < num.length; idx += 1) {
    if (!digits.includes(num[idx])) {
      digits.push(num[idx]);
    } else {
      return false;
    }
  }

  return true;
}

console.log(featured(12));           // 21
console.log(featured(20));           // 21
console.log(featured(21));           // 35
console.log(featured(997));          // 1029
console.log(featured(1029));         // 1043
console.log(featured(999999));       // 1023547
console.log(featured(999999987));    // 1023456987
console.log(featured(9876543186));   // 9876543201
console.log(featured(9876543200));   // 9876543201
console.log(featured(9876543201));   // "There is no possible number that fulfills those requirements."