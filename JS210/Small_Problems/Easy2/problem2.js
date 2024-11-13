function logInBox(msg) {
  let msgSize = msg.length;
  let newMsg = '';

  newMsg += `+-${'-'.repeat(msgSize)}-+\n`;
  newMsg += `| ${' '.repeat(msgSize)} |\n`;
  newMsg += `| ${msg} |\n`;
  newMsg += `| ${' '.repeat(msgSize)} |\n`;
  newMsg += `+-${'-'.repeat(msgSize)}-+\n`;
  
  console.log(newMsg);
}


logInBox('To boldly go where no one has gone before.');
logInBox('');