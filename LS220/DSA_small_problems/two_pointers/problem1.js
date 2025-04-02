/*
You are given a sentence represented by a string str. Your objective is to reverse all the characters in each word of the sentence while ensuring that the case of each character remains unchanged. The spaces between words should be preserved as they are, and the overall order of the words in the sentence must not be altered.

You should solve the problem without using the Array.prototype.reverse method.

*/

/*
--- Problem
INPUT: string
OUTPUT: modified string

  RULES:
  - given a string of words
  - return:
    - reverse all characters in each word of string
      - what do we mean by reverse all chars in each word of string
        - flip words, ie first char becomes last char, 2nd char becomes 2nd to last, etc.
      - what is a word?
        - group of chars between whitespace
    - spaces should be preserved
    - maintain order of words
  - cannot use #reverse

ASsumptions:
- Will words always be separated by 1 whitespace space?
  - yes
- How should we handle an empty string?
  - REtrun empty string
- What about a string of spaces?
  - Will not be given a str of spaces
- How to handle non str args?
  - Always provided non str args
- What about additional args?
  - Will always be provided exactly one string argument

--- Examples
Given: "Hello World" Return: "olleH dlroW"
  - two words; Hello, World
  - reverse words
    - olleH, dlroW
  - combine words: olleH dlroW
  return -> "olleh dlroW"'

Given: "Coding in the sun" REturn "gnidoC ni eht nus"
  - 4 words; Coding, in, the, sun
  - reverse words
    - gnidoC ni eht nus
  -> "gnidoC ni eht nus"

--- DS
- use array to hold all words
- iterate over words
- use 2 pointers to reverse word
--- Algorithm
1. Return an empty string if given ""
2. Split string into words
  #split
3. Reverse each word  ** Helper **
- loop over each word
  - convert into array of chars
  - while start is less than end
    - set start pointer to beginning of word
    - set end pointer to end of word
    - reassign arr[start] to arr[end] and vice versa
    - increment start by 1
    - decrement end by 1
  - combine array of chars back into word
  - return reversed word
4. Convert array of reversed words back into str
  # join
5. Return string
*/

function reverseWord(word) {
  word = word.split('');
  let start = 0;
  let end = word.length - 1;

  while (start < end) {
    [word[start], word[end]] = [word[end], word[start]];
    start += 1;
    end -= 1;
  }

  return word.join('');
}

function reverseWords(string) {
  if (string === '') return '';

  let words = string.split(' ');

  return words.map(word => {
    return reverseWord(word);
  }).join(' ');
}

// console.log(reverseWord("Hello")); // "olleH"
// console.log(reverseWord("Coding")); // "gnidoC"
console.log(reverseWords("Hello World") === "olleH dlroW");
console.log(reverseWords("JavaScript is fun") === "tpircSavaJ si nuf");
console.log(reverseWords("Coding in the sun") === "gnidoC ni eht nus");
console.log(reverseWords("Launch School") === "hcnuaL loohcS");
console.log(reverseWords('') === '');