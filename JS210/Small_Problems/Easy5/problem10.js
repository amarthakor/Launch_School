function reverseWords(sentence) {
  let newSentence = [];

  sentence.split(' ').forEach((word) => {
    if (word.length < 5) {
      newSentence.push(word);
    } else {
      let newWord = '';
      for (let lastIdx = word.length - 1; lastIdx >= 0; lastIdx -= 1) {
        newWord += word[lastIdx];
      }
      newSentence.push(newWord);
    }
  })

  return newSentence.join(' ');
}

console.log(reverseWords('Professional'));             // "lanoisseforP"
console.log(reverseWords('Walk around the block'));    // "Walk dnuora the kcolb"
console.log(reverseWords('Launch School'));            // "hcnuaL loohcS"