/*


Practice chaining promises by creating a chain of four promises. The first promise should resolve with a number; then, the chain should double the number and add 5 in successive .then() calls. Log the result after the final operation.


*/

function numberPromise(number) {
  return new Promise((resolve) => {
    console.log('Modifying number...')
    setTimeout(() => {
      resolve(number);
    }, 1000);
  });
}

numberPromise(4).then((result) => {
  return result * 2;
}).then((result) => {
  return result + 5;
}).then((result) => {
  return result + 5;
}).then((result) => {
  console.log(result);
});