/*
- Add an event handler to the page once the DOM has loaded

- Need to listen for an event where the form is submitted
  - Need to prevent the default behavior of page redirecting / loading
  - Get the value from item name field
  - Get the value from Qauntity field,
    - If empty, assume its 1

  - combine the two values into one string item
  - Store this new item in a container that can access all the items in the list
  
  - Update the unordered list element to display all items in the container
    - Maybe an array outside the form event listener to store all items in the list?

*/

document.addEventListener('DOMContentLoaded', () => {
  let form = document.querySelector('form');
  let list = document.querySelector('#grocery-list');

  form.addEventListener('submit', event => {
    event.preventDefault();
    let newItem = document.querySelector('input#name').value;
    let quantity = document.querySelector('input#quantity').value || '1';
    let listItem = document.createElement('li');
    listItem.textContent = quantity + ' ' + newItem;
    list.append(listItem);

    form.reset();
  });
});