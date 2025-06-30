/*


Rewrite this callback-based downloadFile function as a new promise-based function called downloadFilePromise. Instead of using a callback, it should return a promise that resolves with the message "Download complete!" after a delay.


*/

function downloadFilePromise() {
  console.log('Downloading file...');

  return new Promise((resolve) => {
    // console.log('Downloading file...');
    setTimeout(() => {
      // console.log('Download complete!');
      // resolve();
      resolve('Download complete!');
    }, 1500);
  });
}

// downloadFilePromise();

// downloadFilePromise().then(() => {
//   console.log('Download complete!');
// })

downloadFilePromise().then((result) => {
  console.log(result);
})