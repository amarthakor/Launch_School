/*


Create a function downloadFile that receives a callback function as an argument and simulates downloading a file by logging "Downloading file...". After a delay of 1.5 seconds, it should call the callback with the argument "Download complete!".


*/

function downloadFile(cb) {
  console.log('Downloading file...');

  setTimeout(() => {
    cb('Download complete!')
  }, 1500);
}

downloadFile((status) => { console.log(status) });