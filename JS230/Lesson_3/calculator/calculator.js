/*
--- Problem
Start: Need to create a basic 4 func calculator
Input: Two integers, one operation of + - * /

Rules:
  - Utilize an event listener to handle a click event when the user clicks the = button,
    I can monitor it via the input type being submit for the = button

  - When = is clicked, get the value for the first number (id = 'first-number) and value
    for second number (id = 'second-number')

  - Check to see which operation was selected by the user via the id = 'operator' to
    select a string value of + - * /

  - Convert the string numbers to integers than perform the necessary arithmetic operation

  - Set the computed sum to the new textContent value for the h1 element with id='result'.


*/

document.addEventListener('DOMContentLoaded', () => {
  let form = document.querySelector('form');
  let result = document.querySelector('#result');

  form.addEventListener('submit', event => {
    event.preventDefault();
    let firstNum = +document.querySelector('#first-number').value;
    let secondNum = +document.querySelector('#second-number').value;
    let operationType = document.querySelector('#operator').value
    // if (operationType === '+') {
    //   result.textContent = firstNum + secondNum;
    // } else if (operationType === '-') {
    //   result.textContext = firstNum - secondNum;
    // } else if (operationType === '*') {
    //   result.textContext = firstNum * secondNum;
    // } else if (operationType === '/') {
    //   result.textContext = firstNum / secondNum;
    // }
    if (operationType === '+') result.textContent = firstNum + secondNum;
    if (operationType === '-') result.textContent = firstNum - secondNum;
    if (operationType === '*') result.textContent = firstNum * secondNum;
    if (operationType === '/') result.textContent = firstNum / secondNum;

    // document.querySelector('#test').textContent = `${operationType === '/'}, ${firstNum}, ${secondNum}, ${result.textContent}`;
   });
});