// Given a string `str`, reverse all the consonants in the string and return it.
// Consonants are all alphabetic characters except for the vowels `'a'`, `'e'`, `'i'`,
// `'o'`, and `'u'`, which can appear in both lower and upper cases.
// The consonants can appear more than once in the string.

/*
- given string
- reverse consonats in string
- all alpha chars except a e i o u
- both upper/ lower case

*/

function reverseConsonants(str) {
  if (str === '') return '';
  str = str.split('');
  let start = 0;
  let end = str.length - 1;

  for (let i = 0; i < str.length; i += 1) {
    if (/[^aeiou]/i.test(str[start]) && /[^aeiou]/i.test(str[end])) {
      [str[start], str[end]] = [str[end], str[start]];
      start += 1;
      end -= 1;
    } else if (/[aeiou]/i.test(str[start])) {
      start += 1;
    } else if (/[aeiou]/i.test(str[end])) {
      end -= 1;
    }
    if (end <= start) break;
  }

  return str.join('');
}
console.log(reverseConsonants('hl')); // 'lh'
console.log(reverseConsonants("") === "");
console.log(reverseConsonants("s") === "s");
console.log(reverseConsonants("HELLO") === "LELHO");
console.log(reverseConsonants("leetcode") === "deectole");
console.log(reverseConsonants("example") === "elapmxe");
console.log(reverseConsonants("Consonants") === "sotnonasnC");

// All test cases should log true