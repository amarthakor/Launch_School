function greetings(nameArr, personalInfo) {
  let greeting = 'Hello, ' + nameArr.join(' ') + '! Nice to have a ';

  for (let idx = 0; idx < Object.values(personalInfo).length; idx += 1) {
    greeting += `${Object.values(personalInfo)[idx]} `;
  }

  greeting += 'around.';
  return greeting;
}


console.log(greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }));

// console output
// Hello, John Q Doe! Nice to have a Master Plumber around.