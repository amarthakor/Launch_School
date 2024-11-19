function wordSizes(msg) {
  if (msg === '') return {};
  let sizes = {};
  let words = msg.replaceAll(/[^A-Za-z ]/g, '').split(' ');

  words.forEach((word) => {
    if (sizes[word.length]) {
      sizes[word.length] += 1;
    } else {
      sizes[word.length] = 1
    }
  })

  return sizes;
}




console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 2 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 3 }
console.log(wordSizes("What's up doc?"));                              // { "5": 1, "2": 1, "3": 1 }
console.log(wordSizes(''));                                            // {}