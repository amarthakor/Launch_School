// Question 3: Object Transformation (Medium)
// Difficulty​: Intermediate
// Problem​: Write a function called transformObject that takes an object and a callback function. The function should return a new object where each value has been transformed by the callback function while keeping the same keys.


// javascript

const input = { a: 1, b: 2, c: 3 };
console.log(transformObject(input, num => num * 2));
// Should return: { a: 2, b: 4, c: 6 }

const words = { first: 'hello', second: 'world' };
console.log(transformObject(words, word => word.toUpperCase()));
// Should return: { first: 'HELLO', second: 'WORLD' }