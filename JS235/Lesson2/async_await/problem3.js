/*

Write a getReady function that utilizes at least three asynchronous functions that you write to simulate getting ready in the morning. Each task should take time and not begin until the task before has been completed. getReady should utilize async / await.

*/


function getDressed() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve('Getting dressed');
    }, 5000);
  });
}

function brushTeeth() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve('Brushing teeth');
    }, 3000);
  });
}

function ready() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve("I'm ready!");
    }, 2000);
  });
}

async function getReady() {
  console.log('Good morning!');
  console.log('Petting cat...');

  const array = [getDressed, brushTeeth, ready];

  for (let i = 0; i < 3; i++) {
    let result = await array[i]();
    console.log(result);
  }
}

// Here's an example of how your getReady function may behave:

getReady();
// Good morning!
// Petting cat...
// Getting dressed... (5 seconds later)
// Brushing teeth...  (3 seconds later)
// I'm ready!         (2 seconds later)