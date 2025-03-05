// 2.  ​Intermediate​: Create a function that takes a string and returns an object containing the count of each character. Case should be ignored, and non-alphanumeric characters should be excluded.


// Example:

function charCount(msg) {
  if (typeof msg !== 'string') return null;
  let filteredMsg = msg.replace(/[^0-9a-z]/gi, '').toLowerCase();
  let charFreq = {};

  filteredMsg.split('').forEach(char => {
    if (charFreq[char]) {
      charFreq[char] += 1;
    } else {
      charFreq[char] = 1;
    }
  });

  return charFreq;
}

console.log(charCount('')); // {}
console.log(charCount(123)); // null
console.log(charCount("Hello, World!")); // returns {h: 1, e: 1, l: 3, o: 2, w: 1, r: 1, d: 1}
console.log(charCount("The quick brown fox.")); // returns {t: 1, h: 1, e: 1, q: 1, u: 1, i: 1, c: 1, k: 1, b: 1, r: 1, o: 2, w: 1, n: 1, f: 1, x: 1}