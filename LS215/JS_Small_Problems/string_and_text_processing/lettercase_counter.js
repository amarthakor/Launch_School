// Write a function that takes a string and returns an object containing three properties: one representing the number of characters in the string that are lowercase letters, one representing the number of characters that are uppercase letters, and one representing the number of characters that are neither.

function letterCaseCount(str) {
  const OBJ = { lowercase: 0, uppercase: 0, neither: 0, };
  for (let idx = 0; idx < str.length; idx += 1) {
    if (/[A-Z]/.test(str[idx])) OBJ.uppercase += 1;
    if (/[a-z]/.test(str[idx])) OBJ.lowercase += 1;
    if (/[^a-z]/i.test(str[idx])) OBJ.neither += 1;
  }

  return OBJ;
}

console.log(letterCaseCount('abCdef 123'));  // { lowercase: 5, uppercase: 1, neither: 4 }
console.log(letterCaseCount('AbCd +Ef'));    // { lowercase: 3, uppercase: 3, neither: 2 }
console.log(letterCaseCount('123'));         // { lowercase: 0, uppercase: 0, neither: 3 }
console.log(letterCaseCount(''));            // { lowercase: 0, uppercase: 0, neither: 0 }