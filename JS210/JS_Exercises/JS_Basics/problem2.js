const myBoolean = true;
const myString = 'hello';
const myArray = [];
const myOtherString = '';

if (myBoolean) {
  console.log('Hello');
}

if (!myString) {
  console.log('World');
}

if (!!myArray) {
  console.log('World');
}

if (myOtherString || myArray) {
  console.log('!');
}

// Go over the following program. What does it log to the console at lines 7, 11,
// 15, and 19? Is it what you expected? Why or why not?

// Lines 7, 11, and 19 are logged while line 15 is not logged, as it is a falsy value
// All other values are truthy and thus the conditional if branches execute their
// following blocks