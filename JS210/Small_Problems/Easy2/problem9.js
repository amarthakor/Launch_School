function cleanUp(msg) {
  msg = msg.replace(/[^A-Za-z]/g, ' ');
  let newMsg = '';

  for (let idx = 0; idx < msg.length; idx += 1) {
    if (msg[idx] !== msg[idx + 1]) {
      newMsg += msg[idx];
    }
  }

  return newMsg;
}


cleanUp("---what's my +*& line?");    // " what s my line "