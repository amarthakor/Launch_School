const WORD_TO_DIGIT = {
  'one': 1, 'two': 2, 'three': 3, 'four': 4, 'five': 5,
  'six': 6, 'seven': 7, 'eight': 8, 'nine': 9, 'zero': 0,
  'one.': 1, 'two.': 2, 'three.': 3, 'four.': '4.', 'five.': 5,
  'six.': 6, 'seven.': 7, 'eight.': 8, 'nine.': 9, 'zero.': 0,
};

// Should change second KV pairs to strings to include period for end fo sentence
// punctuation.

function wordToDigit(msg) {
  msg = msg.split(' ').map((word) => {
    return (WORD_TO_DIGIT[word]) ? WORD_TO_DIGIT[word] : word;
  })

  return msg.join(' ');
}

console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."