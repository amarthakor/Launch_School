let a = 'outer';

function testScope() {
  a = 'inner';
  console.log(a);
}

console.log(a);
testScope();
console.log(a);

// - line 8 logs 'outer' bc we declare and initialize the global var `a` on line 1,
//   which is what is passed to log as an argument
// - line 9 invokes the `testScope()` function which reassigns the global var `a` to
//   'inner' and then logs it to the display
// - line 10 outputs 'inner' as the global var `a` has been reassigned to 'inner' frmo
//   within the testScope function