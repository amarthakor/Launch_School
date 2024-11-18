// const person = { name: 'Victor' };
// const otherPerson = { name: 'Victor' };

// console.log(person === otherPerson);    // false -- expected: true

// outputs false because === is testing if both objects are the same
// when in reality they are different objects with merely the same KV pairs

// to fix this:

const person = {name: 'Victor'};
const otherPerson = person;

console.log(person === otherPerson);