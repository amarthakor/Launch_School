function wordCount(msg) {
  let wordsArr = msg.split(' ');
  let wordSize = {}

  wordsArr.forEach((keyWord) => {
    wordSize[keyWord] = wordsArr.filter(word => word === keyWord).length});
  return wordSize;
}

console.log(wordCount('box car cat bag box'));  // { box: 2, car: 1, cat: 1, bag: 1 }