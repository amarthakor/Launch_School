// logMultiples(17);
// // output (5x, 3x and 1x)
// 85
// 51
// 17

// logMultiples(21);
// // output (3x and 1x)
// 63
// 21

function logMultiples(number) {
  for (let currentNum = 100; currentNum >= 1; currentNum -= 1) {
    if (currentNum % number === 0 && (currentNum / number) % 2 === 1 ) {
      console.log(currentNum);
    }
  }
}

logMultiples(17); // 85, 51, 17
logMultiples(21); // 63, 21
logMultiples(13); // 91, 65, 39, 13