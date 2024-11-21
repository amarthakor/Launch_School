function centerOf(msg) {
  let midIdx = Math.floor(msg.length / 2);
  if (msg.length % 2 === 1) return msg[midIdx];
  return msg[midIdx - 1] + msg[midIdx];
}


console.log(centerOf('I Love JavaScript')); // "a"
console.log(centerOf('Launch School'));     // " "
console.log(centerOf('Launch'));            // "un"
console.log(centerOf('Launchschool'));      // "hs"
console.log(centerOf('x'));                 // "x"