let rlSync = require('readline-sync')
let scores = []

for (let idx = 1; idx <= 3; idx += 1) {
  score = Number(rlSync.question(`Enter score ${idx}: `));
  scores.push(score);
}

totalScore = scores.reduce((acc, currentValue) => acc + currentValue, 0);
avgScore = totalScore / 3

if (avgScore >= 90) {
  console.log('Based on the average of your 3 scores your letter grade is "A".');
} else if (avgScore >= 70 && avgScore < 90) {
  console.log('Based on the average of your 3 scores your letter grade is "B".');
} else if (avgScore >= 50 && avgScore < 70) {
  console.log('Based on the average of your 3 scores your letter grade is "C".');
} else {
  console.log('Based on the average of your 3 scores your letter grade is "F".');
}