// Write a function that takes a string as an argument and returns that string with every lowercase letter changed to uppercase and every uppercase letter changed to lowercase. Leave all other characters unchanged.

// Examples:

function swapCase(string) {
  let newString = '';

  for (let idx = 0; idx < string.length; idx += 1) {
    if (/[A-Z]/.test(string[idx])) newString += string[idx].toLowerCase();
    if (/[a-z]/.test(string[idx])) newString += string[idx].toUpperCase();
    if (/[^a-z]/i.test(string[idx])) newString += string[idx];
  }

  return newString;
}

console.log(swapCase('CamelCase'));              // "cAMELcASE"
console.log(swapCase('Tonight on XYZ-TV'));      // "tONIGHT ON xyz-tv"