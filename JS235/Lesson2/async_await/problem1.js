/*

Convert the downloadFilePromise function you saw previously to an asynchronous function named asyncDownloadFile. Utilize await to pause execution until the file download completes before logging the success message.

*/

function downloadFile() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      console.log("Download complete!");
      resolve();
    }, 1500);
  });
}

async function asyncDownloadFile(promise) {
  console.log('Downloading file...');
  await promise;
}

asyncDownloadFile(downloadFile());