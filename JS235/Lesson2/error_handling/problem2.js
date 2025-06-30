/*


Imagine a situation where you must clean up resources (e.g., close a file) whether an operation succeeds or fails. Create a promise that resolves with "Operation complete" and demonstrate how to perform cleanup after the operation completes using .finally().


*/

let myPromise = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve('Operation complete');
  }, 2000);
});

myPromise.then((result) => {
  console.log(result);
}).catch(() => {
  console.log('Error, something happened');
}).finally(() => {
  console.log('Cleaning up file...');
});