function repeatedCharacters(word) {
  let charsObj = {};
  let allChars = word.toLowerCase().split('');
  
  allChars.forEach((char) => {
    if ((allChars.filter((letter) => letter === char).length) > 1) {
      charsObj[char] = allChars.filter((letter) => letter === char).length
    }
  });

  return charsObj;
}


console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }