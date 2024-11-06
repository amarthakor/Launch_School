rlSync = require('readline-sync');
let phrase = rlSync.question("Enter a word or phrase: ");

console.log(`There are ${phrase.length} characters in "${phrase}".`);