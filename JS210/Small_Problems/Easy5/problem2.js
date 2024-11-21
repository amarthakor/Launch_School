const CONSONANTS = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm',
                    'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z'];

function doubleConsonants(msg) {
  let newMsg = '';

  for (let idx = 0; idx < msg.length; idx += 1) {
    if (CONSONANTS.includes(msg[idx].toLowerCase())) {
      newMsg += msg[idx] + msg[idx];
    } else {
      newMsg += msg[idx];
    }
  }

  return newMsg;
}

console.log(doubleConsonants('String'));          // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!'));    // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th'));        // "JJullyy 4tthh"
console.log(doubleConsonants(''));                // ""