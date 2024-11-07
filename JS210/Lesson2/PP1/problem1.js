let a = 'outer';

function testScope() {
  let a = 'inner';
  console.log(a);
}

console.log(a);
testScope();
console.log(a);

// line 8 logs 'outer' to the console
// line 9 logs 'inner' to the console
// line 10 logs 'outer' to the console

//  - line 8 logs 'outer' to the console bc on line 1 we declare and initialize
//  the global variable `a` and assign it to the string 'outer'
//  - line 9 logs 'inner' bc we declare and initialize the local variable `a` that
    // is scoped to the function and assign it to the string 'inner'
//  - line 10 logs 'outer' bc the `a` on line 10 is the global var on `line 1` again