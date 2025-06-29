/*


Build a function waterfallOverCallbacks that chains the execution of multiple callbacks. This function should take an array of callbacks and an initial value as arguments. The main function should pass the return value of each callback to the next callback in the array, using the initial value as the argument to the first callback.

- What does this mean?
  - Have a function with two arugments
    - inital value
    - array
      - elements are callback fns
- What does this fn do?
  - Main fn passes return value of the current callback to the next callback in the array
  - Initial value is used as the argument to the first callback

- What are we doing?
  - Passing an argument to each callback in the array
  - The first callback is passed the initial argument
  - All successive callbacks are passed the return value from the previous callback
  - Last callbacks return value is returned by the main function

- How can I pass an argument from one element to the next element?

- let initla = 2
- (2, [1, 2, 3])
- let callbackArg = initial
[1, 2, 3].forEach(value => {
  callbackArg = cb(callbackArg)
  });
*/

function waterfallOverCallbacks(arrayOfCallbacks, initial) {
  let callbackArg = initial;

  arrayOfCallbacks.forEach(callback => {
    callbackArg = callback(callbackArg);
  });

  return callbackArg;
}

// Example usage:
const double = (x) => x * 2;
console.log(waterfallOverCallbacks([double, double, double], 1));
// Logs: 8