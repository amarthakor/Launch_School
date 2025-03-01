// Create a function that takes a string and returns an object where the keys are the characters in the string, and the values are the frequency of each character.

/*
INPUT:  string argument
OUTPUT: object

Rules:
  - Given a string of chars
  - Return an object where KV pairs are:
    - Keys are all unique characters in the string
    - Values are count / frequency of these unique chars

Assumptions:
  - How should we deal with an empty str?
    - Return empty {}
  - Will we ever have whitespace or other chars such as !@#0-9?
    - Yes, treat the same as alphabetical chars
  - How should we handle non string args
    - Return null
  - Will we ever have additional arguments?
    - Always precisely one argument passed in
  - Lower / upper case or mixed case and how to handle?
    - Mixed case can occur, case matters, a !== 'A'

----------
charFrequency("hello")); // { h: 1, e: 1, l: 2, o: 1 }
 - Given 'hello'
  -> {}
  -> h x1
     e x1
     l x2
     o x1
  -> {h: 1, e:1, l: 2, o: 1}

charFrequency("aabbaa")); // { a: 4, b: 2 }

charFrequency("aAaAbBbb"); // {a: 2, A: 2, b: 3, B: 1}
charFrequnecy("aaa!@#$!@#$AAAaaa  aaa ") // { a:9, !: 2, @: 2, #: 2, $: 2, A: 3}

-------
- given a string
- need to return object
- utilize for loop and object to create unique chars and their counts
---------

1. Handle edge case conditions
  - Return null if non string argument
  - Return {} if empty string arg
2. Create an empty object
3. Set all unique chars as keys and their frequencies as values
  - Loop thru the string
  - For each character
    - If the current char is not a 'key' within our object
      - Set the current char as a key and its value to 1
    - Else
      - Increment the value of the current key by 1

4. Return this object
*/

function charFrequency(string) {
  if (typeof string !== 'string') return null;
  if (string === '') return {};

  let uniqCharCount = {};

  for (let idx = 0; idx < string.length; idx += 1) {
    if (!uniqCharCount[string[idx]]) {
      uniqCharCount[string[idx]] = 1;
    } else {
      uniqCharCount[string[idx]] += 1;
    }
  }
  
  return uniqCharCount;
}

console.log(charFrequency("hello")); // { h: 1, e: 1, l: 2, o: 1 }
console.log(charFrequency("aabbaa")); // { a: 4, b: 2 }

console.log(charFrequency("aAaAbBbb")); // {a: 2, A: 2, b: 3, B: 1}
console.log(charFrequency("aaa!@#$!@#$AAAaaa  aaa ")); // { a:9, !: 2, @: 2, #: 2, $: 2, A: 3}

console.log(charFrequency(1)); // null
console.log(charFrequency('')); // {};

console.log(charFrequency("  ")); // { " ": 2 }
console.log(charFrequency("a")); // { a: 1 }
console.log(charFrequency("123")); // { '1': 1, '2': 1, '3': 1 }
console.log(charFrequency("Hello, World!")); // { H: 1, e: 1, l: 3, o: 2, ',': 1, ' ': 1, W: 1, r: 1, d: 1, '!': 1 }
console.log(charFrequency("\n\t")); // { '\n': 1, '\t': 1 }
console.log(charFrequency("12345678901234567890")); // { '1': 2, '2': 2, '3': 2, '4': 2, '5': 2, '6': 2, '7': 2, '8': 2, '9': 2, '0': 2 }