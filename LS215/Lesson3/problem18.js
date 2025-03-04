// 1.  String Problem:
//    Write a function that takes a string and returns the string with every other character removed. The function should handle empty strings and strings with only one character.

/*
INPUT: string
output: modified string

Rules:
  - Return string should have EOO character removed
  - Should handle empty strings and one char long strings

Assumptions:
  - Do we start removing chars starting at the even or odd characters?
    - Start removing chars after the first char, so 2, 4, 6, 8...
  - How should we handle non string arguments
    - Return null
  - What about additional arguments?
    - Ignore additional arguments
  - Can the strings provided contain any charcter such as special chars, mix case, etc and should they all be removed accordingly?
    - Any type of char can be found and they should be removed following the same rules

----------------------
Given "hello" -> "hlo"
  - h e l l o (5 chars)
  - 1 2 3 4 5
  - remove 2 and 4 (even chars)
  -> "hlo"

Given "Hello, World!" -> "Hlo ol!"
  - H e l l o , ' ' W o r l   d  !
  - 1 2 3 4 5 6  7  8 9 10 11 12 13
  - 2 4 6 8 10 12 (e l , W r d)
  -> "Hlo ol!"

------------------------
- for loop to iterate over my string

-------------------------
1. Handle non string arguments
2. Create a new string
3. Select every other char starting w the first char and add it to the new string
  - Loop over all chars
  - For each char
    - If its index position is even
      - Increment the new string by the current letter

4. Rteturn the new string
*/

function removeEveryOther(word) {
  if (typeof word !== 'string') return null;
  let newWord = '';

  for (let idx = 0; idx < word.length; idx += 1) {
    if (idx % 2 === 0) newWord += word[idx];
  }

  return newWord;
}
// javascript

console.log(removeEveryOther([]) === null);
console.log(removeEveryOther("hello") === "hlo");
console.log(removeEveryOther("") === "");
console.log(removeEveryOther("a") === "a");
console.log(removeEveryOther("abcdef") === "ace");
console.log(removeEveryOther("Hello, World!") === "Hlo ol!");

console.log(removeEveryOther(""));  // Should return ""
console.log(removeEveryOther("A"));  // Should return "A"
console.log(removeEveryOther("Ab"));  // Should return "A"
console.log(removeEveryOther("A b c d e f"));  // Should return "Abcdef"
console.log(removeEveryOther("🙂🙃😉😊"));  // Should return "🙂😉"
console.log(removeEveryOther("\n\t\r") === "\n\r");  // Should return "\n\r"
console.log(removeEveryOther(null));  // Should return null
console.log(removeEveryOther(undefined));  // Should return null
console.log(removeEveryOther(42));  // Should return null
console.log(removeEveryOther({}));  // Should return null
console.log(removeEveryOther([]));  // Should return null