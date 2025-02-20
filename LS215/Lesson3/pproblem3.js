// Problem: Longest Palindromic Substring
// Write a function that takes a string as an input and returns the longest palindromic substring within that string. A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward, ignoring spaces, punctuation, and capitalization.
// If there are multiple palindromic substrings with the same maximum length, return the first one that appears in the string.

/*
---- PROBLEM
INPUT: string 
OUTPUT: string (longest palindromic substr)

Rules:
  - What is a palindromic substring?
    - Palindrome is a word, phrase number or other seq of chars that reads the same forward and backword
      - Ignore spaces, punctation, and capitalization
      - 'Habal' === 'aba'
      - 'A b B a.' === 'abba'
  - If there are multiple palindromic substrings w/ same max length
    - Return the first one that appears in the string

Assumptions:
  - What case should the return value be in? IF the given string contains upper/lowercase and case
  does not matter, it is safe to assume that the return string should be the same case or all lowercase / uppercase?
    - Return the substring in the same case as the original string, but case does not matter
  - How to deal with empty strings?
    - Return empty string
  - What if multiple args are given?
    - Ignore all additional arguments
  - What if a nonstring arg is passed?
    - Return null in this case
  - What characters consist of punctuation that should be ignored?
    - Ignore `? . ! ,` chars, in addition to whitespace and case. All other chars
      including special characters are allowed
  - If we are given a str of special chars w/ no alphas, should we ignore these strings?
    - Process them as usual, if there is a palindromic substr, return it
  - If given a single char string that is punct / whitespace how should i handle?
    - Return empty string
---- EXAMPLES
longestPalindrome("babad")); // Should output: "bab" or "aba"
  - Find longest palindromic substr, thus i need to create all substrings
    - 'b', 'ba', 'bab', 'baba', 'babad'
    - 'a', 'ab', 'aba', 'abad'
    - 'b', 'ba', 'bad'
    - 'a', 'ad'
    - 'd'

    - palindromes are: 'b', 'a', 'b', 'a', 'd', 'bab', 'aba'
    - select the one that is the longest and appears first
  -> 'bab'

longestPalindrome("cbbd")); // Should output: "bb"
    - 'c', 'cb', 'cbb, 'cbbd'
    - 'b', 'bb', 'bbd',
    - 'b', 'bd'
    - 'd'
    pals: 'c', 'b', 'bb', 'b', 'd'
    longest pal == 'bb'
  -> 'bb'

longestPalindrome("a")); // Should output: "a"
  -> if single char, return char
  -> 'a'

longestPalindrome("ac")); // Should output: "a"
  -> 'a'

longestPalindrome("racecar")); // Should output: "racecar"
  - 'racecar' === 'racecar'
  -> 'racecar'

longestPalindrome("Hello, World!")); // Should output: "ll"
  - 'Hello, World!' -> 'HelloWorld'
    - 'H', 'He', 'Hel', 'Hell', hello, hellow, hellowo, hellowor, helloworl, helloworld
    - e, el, ell, ello, elloW, elloWo, elloWor, elloWorl, elloworld
    - l, ll, llo, lloW, lloWo, lloWor, lloWorl, lloWorld
    - l, lo, loW, loWo, loWor, loWorl, loWorld
    - o, oW, oWo, owor, oWorl, oWorld
    - W, Wo, Wor, Worl, World
    - o, or, orl, orld
    - r, rl, rld
    - l, ld
    - l
    pals: H, e, l, ll, l, o, oWo, W, o, r, l, l
  -> longest pal 'oWo'

(longestPalindrome('')); // ''
  -> Given empty string, return empty string

(longestPalindrome('babad', 'bbabbad'); // 'bab'
  -> Given multiple args, ignore first arg

(longestPalindrome('$$$'); // '$$$'
  -> Given special chars / non alphas rule sstay the same
  - $ $$ $$$ $ $$ $
  -> '$$$'

(longestPalindrome('a.b!b?a'); // 'abba'
  -> Ignore punctuation
    'abba'
  -> 'abba' longest palindromic

(longestPalindrome('Race.car!'); // 'Racecar'
  -> Ignore punct --> 'Racecar'
  -> 'Racecar' longest palindormic substring

(longestPalindrome([1, 2, 3]); // null
  -> Return null for non string args
(longestPalindrome('1221'); // '1221'
  - 1 12 122 1221
    - 1221 === 1221.reverse
  -> '1221'

---- DATA STRUC
- Arrays will allow easy stoarge of substrings, can also perform
  - transformation (finding longest length)
  - filtering (seeing which substr === max length)
  - holding all substrings

---- ALGORITHM
1. Return null for invalid conditions
2. Return '' for valid conditions
3. Modify word to remove whitespace, punct
  - replace all whitespace and punct (! ? . , -) with ''

3. Creat all possible palindrome ** HELPER METHOD **
4. Find the length of the longest palindrome
  - Transform all palindromes to their length count
  - Sorth them from largest to smallest
  - Select the first value

5. Select all longest palindromes
  - initialize `longest_pals`
  - Filter all palindromes
    - If the current subtr length is === max length
      - Sekect it

6. Return the first longest palindrome
  - Select the first element in longest_pals

** findPalindrome **
1. CREATE all palindormes
  - For each character
    - Create all substrings from the current char to the last char
      - If this substr is === to its reverse in all lowercase
        - Push it to a holding array
2. Return array of palindrome substr

*/

function longestPalindrome(word) {
  if (typeof word !== 'string') return null;
  if (word === '' || word.replace(/[\s.!?\-,]/g, '') === '') return '';
  word = word.replace(/[\s.!?\-,]/g, '');
  let pals = findPalindromes(word);
  let max_length = pals.map(el => el.length).sort((a, b) => b - a)[0];
  return pals.filter(el => el.length === max_length)[0];
}

function findPalindromes(word) {
  let palindromes = [];

  word.split('').forEach((char, startIdx) => {
    for (let i = startIdx + 1; i <= word.length; i++) {
      let reverseSubstr = word.slice(startIdx, i).split('').reverse().join('');
      let substr = word.slice(startIdx, i);
      if (substr.toLowerCase() === reverseSubstr.toLowerCase()) palindromes.push(substr);
    }
  });

  return palindromes;
}

// console.log(findPalindromes('babad'));
console.log(longestPalindrome("babad") === 'bab'); // Should output: "bab" or "aba"
console.log(longestPalindrome("cbbd") === 'bb'); // Should output: "bb"
console.log(longestPalindrome("a") === 'a'); // Should output: "a"
console.log(longestPalindrome("ac") === 'a'); // Should output: "a"
console.log(longestPalindrome("racecar") === 'racecar'); // Should output: "racecar"
console.log(longestPalindrome("Hello, World!") === 'oWo'); // Should output: "oWo"

console.log((longestPalindrome('')) === '');                             // ''
console.log((longestPalindrome('babad', 'bbabbad')) === 'bab');             // 'bab'
console.log((longestPalindrome('$$$')) === '$$$');                          // '$$$'
console.log((longestPalindrome('a.b!b?a')) === 'abba');                      // 'abba'
console.log((longestPalindrome('Race.car!')) === 'Racecar');                    // 'Racecar'
console.log((longestPalindrome([1, 2, 3])) === null);                      // null
console.log((longestPalindrome('1221')) === '1221');                         // '1221'
console.log(longestPalindrome('!') === '');                              // ''
console.log(longestPalindrome(' ') === '');                              // ''