// Difficulty​: Intermediate
// Problem​: Write a function called deepEqual that takes two objects and returns true if they are deeply equal (i.e., all properties and nested properties have the same values).


// javascript

const obj1 = { a: 1, b: { c: 2 } };
const obj2 = { a: 1, b: { c: 2 } };
const obj3 = { a: 1, b: { c: 3 } };

console.log(deepEqual(obj1, obj2)); // Should return: true
console.log(deepEqual(obj1, obj3)); // Should return: false