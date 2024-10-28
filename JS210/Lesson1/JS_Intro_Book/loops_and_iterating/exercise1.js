let age = 26;

for (let newAge = 10; newAge <= 40; newAge += 10) {
  if (newAge === 10) console.log(`You are currently ${age} years old.`);

  console.log(`In ${newAge} years you will be ${age + newAge} years old.`);
}
