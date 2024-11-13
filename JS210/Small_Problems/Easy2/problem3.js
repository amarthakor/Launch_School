function stringy(num) {
  let string = '';

  for (let idx = 0; idx < num; idx += 1) {
    if (idx % 2 === 0) string += '1';
    if (idx % 2 === 1) string += '0';
  }

  console.log(string);
}

stringy(6);    // "101010"
stringy(9);    // "101010101"
stringy(4);    // "1010"
stringy(7);    // "1010101"