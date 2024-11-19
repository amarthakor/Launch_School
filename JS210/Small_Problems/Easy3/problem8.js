function swap(sentence) {
  wordsArr = sentence.split(' ');

  newWordsArr = wordsArr.map((word) => {
    let firstChar = word[0];
    let lastChar = word[word.length - 1];
    word = word.split('');
    word[0] = lastChar;
    word[word.length - 1] = firstChar;
    return word.join('');
  });

  return newWordsArr.join(' ');
}


console.log(swap('Oh what a wonderful day it is'));  // "hO thaw a londerfuw yad ti si"
console.log(swap('Abcde'));                          // "ebcdA"
console.log(swap('a'));                              // "a"