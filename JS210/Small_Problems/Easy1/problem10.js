function utf16Value(str) {
  let utfSum = 0;

  for (let idx = 0; idx < str.length; idx += 1) {
    utfSum += str[idx].charCodeAt();
  }

  console.log(utfSum);
  return utfSum;
}


utf16Value('Four score');         // 984
utf16Value('Launch School');      // 1251
utf16Value('a');                  // 97
utf16Value('');                   // 0

const OMEGA = "\u03A9";             // UTF-16 character 'Ω' (omega)
utf16Value(OMEGA);                  // 937
utf16Value(OMEGA + OMEGA + OMEGA);  // 2811