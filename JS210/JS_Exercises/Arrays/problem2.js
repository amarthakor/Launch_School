let myArray = [1, 2, 3, 4];
const myOtherArray = myArray.slice();
mySecondOtherArray = Array.from(myArray);

myArray.pop();
console.log(myOtherArray);
console.log(mySecondOtherArray);
