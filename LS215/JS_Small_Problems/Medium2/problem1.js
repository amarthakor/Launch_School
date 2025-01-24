// Write a function that takes a string and returns an object containing the following three properties:

// the percentage of characters in the string that are lowercase letters
// the percentage of characters that are uppercase letters
// the percentage of characters that are neither
// You may assume that the string will always contain at least one character.

/*
----- PROBLEM -----
INPUT: string
OUTPUT: Object with three KV pairs

Rules:
- Return Object has three KV pairs;
  - First KV pair `lowercase: "*.**"` represents the % of chars in the string that
    are in lowercase
  - Second KV pair `uppercase: "*.**"` represents the % of chars in the string that
    are in uppercase
  - Third KV pair `neither: "*.**"` represents the % of chars in the string that are
    neither uppercase or lowercase characters
- Values in KV pairs are represented as strings
- Value `percentages` go up to hundreths place holder, even if there is no number
  - Thus 100% would be "100.00", not "100.0" or "100"
- String will always contain at least one character


----- EXAMPLES -----


----- DS -----
- Object DS would be ideal since return value must be objkect

----- ALGORITHM -----
- Find the overall length of the msg
- Create an object with three KV pairs, lowercase: uppercase: and neither:
  - {lower: 0, upper: 0, neither: 0};
- SELECT all lower/upper/ niether chars and divide their totals by the total length of str
  - if lower, filter string to only contain array of lower chars and find length
  - if upper, filter str to only contian array of upper chars and find length
  - if neither, filter str to only contain array of neither chars and find length
- Transform the percentages into correct formating and assign to KV pairs
  - set {lowercase:} to lower / total chars
  - set {uppercase:} to lower / total chars
  - set {neither:} to lower / total chars
  - Iterate thru all values and transofrm to string w/ 2 decimal places
    - #toFixed(2)
- Return object

*/

function letterPercentages(msg) {
  let totalChars = msg.length;
  let letterPercents = { lowercase: 0, uppercase: 0, neither: 0 };

  let lowerCount = msg.split('').filter(char => /[a-z]/.test(char)).length;
  let upperCount = msg.split('').filter(char => /[A-Z]/.test(char)).length;
  let neitherCount = msg.split('').filter(char => /[^a-z]/i.test(char)).length;

  lowerCount = (lowerCount * 100 / totalChars).toFixed(2);
  upperCount = (upperCount * 100 / totalChars).toFixed(2);
  neitherCount = (neitherCount * 100 / totalChars).toFixed(2);

  letterPercents.lowercase = lowerCount;
  letterPercents.uppercase = upperCount;
  letterPercents.neither = neitherCount;

  return letterPercents;
}



// Examples:
console.log(letterPercentages('abCdef 123'));
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }