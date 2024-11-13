let rlSync = require('readline-sync');

let noun = rlSync.question('Enter a noun: \n');
let verb = rlSync.question('Enter a verb: \n');
let adj = rlSync.question('Enter a adjective: \n');
let adverb = rlSync.question('Enter a adverb: \n');

console.log(`Do you ${verb} your ${adj} ${noun} ${adverb}? That's hilarious!`);
