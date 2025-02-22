// 1.  String Transformation:
// Write a function that takes a string and transforms it based on the following rules:
// •   Capitalize the first letter of every word
// •   Replace any repeated characters with a single occurrence, unless they're separated by a space
/*
---- PROBLEM
INPUT: One string argument
OUTPUT: string

Rules:
  - Given a string, transofrm the storng according to these rules:
    - Capitalize 1st letter of every word

    - "replace any repeated characters w/ a single occurrence unless they're separated by a sapce"
      -> repeated characters within the same word
      -> collapse the repeated characters into a single char

Assumptions:
- What should we return if given an empty string?
  - Return an empty string
- What about non string arguments?
  - Return null
- Is there a limit on how long the string will be?
  - No, there is no limit to str length
- Will we have to account for words starting w special chars and how should we hanlde them?
  - Treat them as other words, don't need to capitalize since they aren't letters
- What if the arg contains a string in uppercase or mixed case?
  - Follow the same rules, but string case should be matched to
- What to do if passed multiple str args?
  - Ignore all additional args
- When replacing repeated chars, do chars of different cases count as the same char?
  - No, A does not equal a, thus these are not repeating characters

---- EXAMPLES
transform("hello world") == "Hello World");
  - Given "hello world" -> "Helo World"
    - "Hello World"
    - H, e, l, l, o   W, o, r, l, d
      - two repeated 'l's
      - remove the repeated char
    -> 'Helo World"

transform("good morning sunshine") == "God Morning Sunshine");
transform("aaabbbccc ddd") == "Abc D");
  - "aaa" -> "a", "bbb" -> "b", "ccc" -> "c", "ddd" -> "d"
  - "abc d"
  -> "Abc D";

(transform("") === "");
(transform([]) === null);
(transform("aaaaaaaaaaaaaa bbbbbbbbb cccccccccccccccc") === "A B C");
(transform("@@bc !bbcc") === "@bc !bc");
  -> "@@bc !bbcc"
  - "@@" -> "@", "b", "c".... "!", "bb" -> "b", "cc" -> "c"
  - "@bc !bc"
  -> no alphas, return as is -> "@bc !bc"

(transform("AABBCC BC") === "ABC BC");
  - "AABBCC BC"
  - 1st word: "AA" -> "A", "BB" -> "B", "CC" -> "C"
  - 2nd word: "BC"
  -> "ABC BC"

(transform("aAbBCc") === "AbC");
  - "aAbBcC" 
  - "a", "A", "b", "B", "c", "C"
  - "aAbBcC"
  -> "AAbBcC"
(transform("hello world", "bye world") === "Hello World");

(transform("aA AAA aa") === "AA A A");

---- DATA STRUC
- Array would allow for convenient splitting of string
- Also allow to easily transofrm words / chars then rejoin into string

---- ALGORITHM
1. Return "" / null for qualifying conditions
  - If given an "" string or data type is not a string return "" / null
2. SPLIT the string into an array of chars
  - utilize built int abstraction method
3. Create a new string of non-repeating chars ** HELPER METHOD **
  - replaceRepeats(letters)
4. Capitalize the first letter of every word in the new string
  - Split the new string into an array of words
  - Transofrm each word and capitalize the first letter
  - Finally join the array of words once iteration is complete
5. Return the new string

replaceRepeats
- Given an array of individual characters
- Init a new string
- Find length of array - 1 set as 1last idx`
- For each char
  - If the idx is === `last idx`
    - compare char to previous char in array
    - if its a match
      - move it to the new string
    - if it isnt a match
      - move it to new string
  - Compare the current char to the next char
  - If they are the same
    - Move onto the next element
  - If they are different
    - Add the current char to the string

*/

function transform(words) {
  if (words === '') return '';
  if (typeof words !== 'string') return null;
  words = words.split('');
  // console.log(words);
  let newString = replaceRepeats(words);
  return newString.split(' ').map(word => word[0].toUpperCase() + word.slice(1)).join(' ');
}

function replaceRepeats(letters) {
  // letters = letters.split('');
  let newString = '';
  let last_idx = letters.length - 1;

  letters.forEach((char, idx) => {
    if (idx === last_idx) {
      newString += char;
    } else if (char !== letters[idx + 1]) {
      newString += char;
    }
  });

  return newString;
}

// console.log(replaceRepeats("hello world"));
// console.log(replaceRepeats("aaabbbccc ddd"));
// console.log(replaceRepeats("AAA AA BBB CCC"));
// console.log(replaceRepeats("aA AAA aa"));

console.log(transform("hello world") === "Helo World");
console.log(transform("good morning sunshine") === "God Morning Sunshine");
console.log(transform("aaabbbccc ddd") === "Abc D");

console.log((transform("") === ""));
console.log((transform([]) === null));
console.log((transform("aaaaaaaaaaaaaa bbbbbbbbb cccccccccccccccc") === "A B C"));
console.log(transform("aaa aaa AAA") === "A A A")
console.log((transform("@@bc !bbcc") === "@bc !bc"));
console.log((transform("AABBCC BC") === "ABC BC"));
console.log((transform("aAbBCc") === "AAbBCc")); // low !== upcase
console.log(transform("aA AAA aa") === "AA A A");
console.log((transform("hello world", "bye world") === "Helo World"));