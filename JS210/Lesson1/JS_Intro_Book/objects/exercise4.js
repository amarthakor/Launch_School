let obj = {
  b: 2,
  a: 1,
  c: 3,
};

let myArray = Object.keys(obj);
let newArray = myArray.map((key) => key.toUpperCase());
console.log(newArray);
console.log(obj);