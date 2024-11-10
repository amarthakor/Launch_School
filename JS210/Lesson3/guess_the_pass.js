let rlSync = require('readline-sync');

let failedAttempts = 0
const PASSWORD = 'password'

for (failedAttempts; failedAttempts <= 2;) {
  answer = rlSync.question('Please enter the password\n');

  if (answer === PASSWORD) {
    console.log('You have successfully logged in.');
    break
  } else {
    if (failedAttempts < 2) console.log('That is not correct, please try again.');
    failedAttempts += 1;
  }
}

if (failedAttempts >= 3) {
  console.log('You have been denied access.');
}