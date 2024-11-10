function isXor(a, b) {
  let truthyCount = 0
  let args = [!!a, !!b]

  for (let idx = 0; idx < 2; idx += 1) {
    if (args[idx]) {
      truthyCount += 1;
    }
  }

  return console.log(truthyCount === 1 ? true : false);
}

isXor(false, true);     // true
isXor(true, false);     // true
isXor(false, false);    // false
isXor(true, true);      // false


isXor(false, 3);        // true
isXor('a', undefined);  // true
isXor(null, '');        // false
isXor('2', 23);         // false