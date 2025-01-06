function substrings(str) {
  let results = [];

  for (let startIdx = 0; startIdx <= str.length; startIdx += 1) {
    let currentString = str.slice(startIdx);
    results = results.concat(leadingSubstrings(currentString));
  }

  return results.flat();
}

function leadingSubstrings(str) {
  let results = [];

  for (let idx = 1; idx <= str.length; idx += 1) {
    results.push(str.slice(0, idx));
  }

  return results;
}

console.log(substrings('abcde'));

// returns
// [ "a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e" ]