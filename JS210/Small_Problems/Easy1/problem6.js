function shortLongShort(str1, str2) {
  let short = (str1.length < str2.length) ? str1 : str2;
  let long = (str1.length > str2.length) ? str1 : str2;

  console.log(short + long + short);
  return short + long + short;
}

shortLongShort('abc', 'defgh');    // "abcdefghabc"
shortLongShort('abcde', 'fgh');    // "fghabcdefgh"
shortLongShort('', 'xyz');         // "xyz"