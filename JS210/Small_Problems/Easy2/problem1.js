/*
---- P
Given: string of chars
Return: new string with consecutive duplicate chars removed

does case matter?
what if non str arg provided?

---- E
crunch('ddaaiillyy ddoouubbllee');    // "daily double"
  - all consecutive chars are removed
crunch('4444abcabccba');              // "4abcabcba"
crunch('ggggggggggggggg');            // "g"
  - if all chars are the same then only 1 char should be left
crunch('a');                          // "a"
  - if str size is 1 then return char
crunch('');                           // ""
  - if str arg is empty string then return empty string

---- D
perhaps array or could iterate over given string w index

---- A
- *** GAURD CLAUSE if string empty or string size 1 return str argument
- CREATE new empty string
- ITERATE over given string,
  - If current character is the same as next char
    - do nothing
  - if current char does not equal next char
    - increment empty_str var by current char

- may have to account for last char in str being different
*/

function crunch(str) {
  if (str === '' || str.length === 1) {
    console.log(str);
    return str;
  }

  let newStr = '';
  for (idx = 0; idx < str.length; idx += 1) {
    if (str[idx] !== str[idx + 1]) {
      newStr += str[idx];
    }
  }
  console.log(newStr);
  return newStr;
}


crunch('ddaaiillyy ddoouubbllee');    // "daily double"
crunch('4444abcabccba');              // "4abcabcba"
crunch('ggggggggggggggg');            // "g"
crunch('a');                          // "a"
crunch('');                           // ""