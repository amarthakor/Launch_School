function repeat(str, factor) {
  if (typeof(factor) !== 'number' || factor < 0) return undefined;
  if (factor === 0) return '';
  let newStr = ''

  for (let counter = 0; counter < factor; counter +=1) {
    newStr += str;
  }

  return newStr;
}

repeat('abc', 1);       // "abc"
repeat('abc', 2);       // "abcabc"
repeat('abc', -1);      // undefined
repeat('abc', 0);       // ""
repeat('abc', 'a');     // undefined
repeat('abc', false);   // undefined
repeat('abc', null);    // undefined
repeat('abc', '  ');    // undefined