/*

Extend the code from the previous exercise to log the message 'The request could not be completed!' to the console when the request produces an error. You may replace the URL in the previous exercise with "hts://api.github.com/repos/rails/rails" so that the error handler will be triggered.

*/

async function getJSON() {
  try {
    let response = await fetch('hts://api.github.com/repos/rails/rails');
    let json = await response.json();
    console.log(response.status);
    console.log(json.open_issues);
  } catch (error) {
    console.error(`The request could not be completed due to error: ${error}`);
  }
}

getJSON();