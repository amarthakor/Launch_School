/*


Create a function called flakyService that simulates a service that sometimes fails. The function should return a promise that resolves with "Operation successful" or rejects with "Operation failed" randomly. Use .then() for a successful operation log and .catch() for logging a failed operation.


*/


function flakyService() {
  let successRate = Math.random();

  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (successRate > 0.5) {
        resolve('Operation successful!');
      } else {
        reject('Operation failed!');
      }
    }, 1500);
  });
}

flakyService().then((result) => {
  console.log(result);
}).catch((result) => {
  console.log(result);
});