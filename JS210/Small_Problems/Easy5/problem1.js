function repeater(msg) {
  let newMsg = '';

  for (let idx = 0; idx < msg.length; idx += 1) {
    newMsg += msg[idx] + msg[idx];
  }
  
  return newMsg;
}

console.log(repeater('Hello'));        // "HHeelllloo"
console.log(repeater('Good job!'));    // "GGoooodd  jjoobb!!"
console.log(repeater(''));             // ""