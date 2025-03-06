// Problem​: Write a function that transforms a string by reversing the order of words and converting lowercase letters to uppercase and uppercase letters to lowercase.

/*
-- Problem --
INPUT: string
OUTPUT: string

Rules:
  - Given a string argument
  - Modify the string where;
    - Reverse the order of words
    - Transform teh words such that lowercase -> uppercase and uppercase -> lowercase

Assumptions:
- How should I handle non string args?
  - Return null
- What about additional arguments?
  - Ignore additional arguments
- What if I only have 1 word thats not alphabetical?
  - Return the word
- Should I handle nonalpha chars in a specific way?
  - Leave them unchanged

-- Examples --
Given "Example string"
  - Reverse the order: "string Example"
  - Reverse the case: "STRING eXAMPLE"
  -> ""STRING eXAMPLE""

-- DS --
- Can use an array to reverse order of words
- Use array to iterate over each word

-- Algorithm --
1. Handle invalid cases
2. Split the string into an array of words
  - #split
3. Reverse the order of words
  - #reverse
4. Transform each word such that all chars in the word are opposite case
  - For each word
    - Iterate over all chars in the current word
      - If the current char is downcase, upcase it
      - Else, downcase the current char
  - Return the transformed string

5. Return the transformed reversed string
*/

function string_transformer(words) {
  if (typeof words !== 'string') return null;

  words = words.split(' ').reverse();
  return words.map(word => {
    return word.split('').map(char => {
      return char === char.toLowerCase() ? char.toUpperCase() : char.toLowerCase();
    }).join('');
  }).join(' ');
}

console.log(string_transformer(123) === null);
console.log(string_transformer("Example string") === "STRING eXAMPLE");
console.log(string_transformer("Hello World") === "wORLD hELLO");
console.log(string_transformer("") === "");

// javascript

// Multiple words with mixed case
console.log(string_transformer("JavaScript IS fun") === "FUN is jAVAsCRIPT");

// String with numbers and special characters
console.log(string_transformer("Hello123 World!") === "wORLD! hELLO123");

// String with multiple spaces
console.log(string_transformer("Hello  World") === "wORLD  hELLO");

// String with leading/trailing spaces
console.log(string_transformer("  Hello World  ") === "  wORLD hELLO  ");

// String with only special characters
console.log(string_transformer("!@#$%") === "!@#$%");

// Single word
console.log(string_transformer("Hello") === "hELLO");