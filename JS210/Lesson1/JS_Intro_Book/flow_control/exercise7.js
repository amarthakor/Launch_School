function upcaseBigWords(word) {
  if (word.length > 10) {
    return word.toUpperCase();
  } else {
    return word;
  }
}

upcaseBigWords('hello');
upcaseBigWords('goodbye');
upcaseBigWords('hello world');
upcaseBigWords('i want cheesecake');