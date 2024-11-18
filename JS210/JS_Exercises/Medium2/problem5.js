const array = ['Apples', 'Peaches', 'Grapes'];

array[3.4] = 'Oranges';
console.log(array.length); // 3, because 3.4 is not a non negative integer which
// are the only values that cna be used to index elements within an array
// thus the length call doesnt count 'oranges' as an element within the array
// refferenced by 'array'

console.log(Object.keys(array).length);
// this will return 4 as 3.4: 'Oranges' will be recorgnized as a property of
// the `array` array, just not an element.

array[-2] = 'Watermelon';
console.log(array.length); // 3, same reason as above, needs to be positive integer
console.log(Object.keys(array).length); // 5, same reason as above, recorgnized
// as a proeprty of the array `array`, but not an element.

