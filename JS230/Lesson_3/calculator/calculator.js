/*
--- Problem
- Need to obtain two input values
- Need to select an operation
- Need to display result of the operation and two values

--- Examples

4 + 4
  - Enter 4
  - Select + operation
  - Enter 4
  - Click = button
  - Don't reload page # preventDefualt
  - Display result of the operation 4 + 4 = 8

3 / 4
  - Enter 3
  - Select / operation
  - Enter 4
  - click = button, dont reload page
  - Display result of the operation 3/ 4 = 0.75
  - Need to ensure correct order to avoid 4/ 3 -> 1.333

- What action is being performed on the website that I need to wait for?
  - clicking '=' sign
  - Need to gather 3 data pieces
    - Num 1, operation, num 2
  - Need to set result to num1 operation num2
  - Need to update some element to display the result

--- Algorithm
- Set a listener to the form field
  - Find form element
  - Assign it to 'form' variable
- Collect values from user input
    - Get the value from input1 and assign it to num1
    - Get the operation value and assign to operation
    - Get the value from input2 and assign it to num2
- Perform operation
  - If / then to handle each type of operation dependent on `operation`
    being + - * /
- Display my result
  - Find display element
    - Set to some variable, `display`
  - Set display context to result
*/

document.addEventListener('DOMContentLoaded', () => {
  let form = document.querySelector('form');
  let num1;
  let operator;
  let num2;
  let result;
  let display = document.getElementById('result');

  form.addEventListener('submit', event => {
    event.preventDefault();
    num1 = +form.querySelector('input#first-number').value;
    num2 = +form.querySelector('input#second-number').value;
    operator = form.querySelector('select#operator').value;

    if (operator === '+') {
      result = num1 + num2;
    } else if (operator === '-') {
      result = num1 - num2;
    } else if (operator === '*') {
      result = num1 * num2;
    } else {
      result = num1 / num2;
    }

    display.textContent = result;
  });
});