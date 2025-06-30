/*

Continuing with our chores example, expand upon the previous problem to complete our "after laundry" and "after cookies" actions once each task has been completed. Write a doChores function that manages both washLaundry and bakeCookies.

For reference, here's our callback-based version of doChores:

function doChores() {
  console.log("Starting the chores...");

  washLaundry(function () {
    console.log("Folding Laundry.");
    console.log("Putting away Laundry.");
  });

  bakeCookies(function () {
    console.log("Cooling cookies.");
    console.log("Eating cookies.");
  });
}

doChores();

*/

function washLaundry() {
  console.log("Putting clothes in wash.");
  console.log("Adding soap.");
  console.log("Washing laundry...");

  return new Promise((resolve) => {
    setTimeout(() => {
      console.log('buzz');
      resolve();
    }, 5000);
  });
}

function bakeCookies() {
  return new Promise((resolve) => {
    console.log("Mixing ingredients.");
    console.log("Scooping cookie dough.");
    console.log("Putting cookies in oven.");

    console.log("Baking...");
    setTimeout(() => {
      console.log("Beep!");
      resolve();
    }, 3000);
  });
}

function doChores() {
  washLaundry().then(() => {
    console.log("Folding Laundry.");
    console.log("Putting away Laundry.");
  });

  bakeCookies().then(() => {
    console.log("Cooling cookies.");
    console.log("Eating cookies.");
  });
}

doChores();