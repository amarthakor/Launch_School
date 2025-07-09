document.addEventListener('DOMContentLoaded', () => {
  let answer = Math.floor(Math.random() * 100) + 1;
  let form = document.querySelector('form');
  let link = document.querySelector('a');
  let messageDiv = document.querySelector('p');
  let guesses = 0;

  form.addEventListener('submit', event => {
    event.preventDefault();
    let guess = parseInt(document.getElementById('guess').value, 10);
    guesses++;
    let message;
    if (guess > answer) {
      message = 'Your guess is too high.';
    } else if (guess < answer) {
      message = 'Your guess is too low.';
    } else {
      message = `You guessed it! It took you ${guesses} guesses.`;
    }
    messageDiv.textContent = message;
  });

  link.addEventListener('click', event => {
    event.preventDefault();
    answer = Math.floor(Math.random() * 100) + 1;
    messageDiv.textContent = 'Guess a number from 1 to 100.';
    guesses = 0;
  });
});