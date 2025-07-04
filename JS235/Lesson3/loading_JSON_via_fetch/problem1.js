/*

Write some JavaScript code that loads JSON data from https://api.github.com/repos/rails/rails, parses the JSON into a JavaScript object, and then logs the HTTP status code and the number of open issues to the console. The property to get the number of open issues is open_issues. You may assume the API will always return valid JSON data.

*/

async function getJSON() {
  let response = await fetch('https://api.github.com/repos/rails/rails');
  let json = await response.json();
  console.log(response.status);
  console.log(json.open_issues);
}

getJSON();