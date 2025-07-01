/*


When learning about promises, We wrote a flakyService function and used then and catch to manage its result. Now, rewrite the code that calls flakyService to use async / await instead. Don't change the flakyService function itself.

function flakyService() {
  return new Promise((resolve, reject) => {
    if (Math.random() > 0.5) {
      resolve("Operation successful");
    } else {
      reject("Operation failed");
    }
  });
}

flakyService().then(console.log).catch(console.error);


*/


function flakyService() {
  return new Promise((resolve, reject) => {
    if (Math.random() > 0.5) {
      resolve("Operation successful");
    } else {
      reject("Operation failed");
    }
  });
}

async function riskyService() {
  console.log('Starting operation...');
  try {
    let result = await flakyService();
    console.log(result);
  } catch (error) {
    console.error('An error occurred: ', error);
  }
}

riskyService();