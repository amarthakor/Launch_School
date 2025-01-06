function leadingSubstrings(str) {
  let results = [];

  for (let idx = 1; idx <= str.length; idx += 1) {
    results.push(str.slice(0, idx));
  }

  return results;
}

function substrings(str) {
  let results = [];

  for (let startIdx = 0; startIdx <= str.length; startIdx += 1) {
    let currentString = str.slice(startIdx);
    results = results.concat(leadingSubstrings(currentString));
  }

  return results.flat();
}

function palindromes(str) {
  let results = [];
  results = substrings(str);

  results = results.filter(word =>
    word === word.split('').reverse().join('') && word.length > 1);
  return results;
}

console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]

console.log(palindromes('hello-madam-did-madam-goodbye'));
// returns
// [ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
//   "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
//   "-madam-", "madam", "ada", "oo" ]

console.log(palindromes('knitting cassettes'));
// returns
// [ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]