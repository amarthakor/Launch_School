/*


Implement a loadData function that fetches data but sometimes fails. It should return a promise that either fulfills with "Data loaded" or rejects with "Network error". Use a .catch() block to return a recovery promise that resolves with "Using cached data" in case of failure.


*/

function loadData() {
  return new Promise((resolve, reject) => {
    console.log('Preparing to load data...');
    setTimeout(() => {
      if (Math.random() > 0.5) {
        resolve('Data Loaded.');
      } else {
        reject('Network error');
      }
    }, 1000);
  });
}

loadData()
  .then(console.log)
  .catch((error) => {
    console.log(error);
    return Promise.resolve('Using cached data');
  })
  .then(console.log);