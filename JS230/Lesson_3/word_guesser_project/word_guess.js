class Game {
  static fruits = ['apple', 'banana', 'orange', 'pear'];
  static MAX_GUESSES = 6;

  static getRandomWord() {
    let randomIdx = Math.floor(Math.random() * this.fruits.length);
    let word = this.fruits[randomIdx];
    this.fruits.splice(randomIdx, 1);
    return word;
  }

  constructor() {
    this.word = Game.getRandomWord();
    this.currentWord = this.#setWord();
    this.incorrectGuesses = 0;
    this.lettersGuessed = [];
    this.hasWon = false;
    this.hasLost = false;

    if (!this.word) throw new Error('You beat the game, no more words left!');
    this.word = this.word.split('');
  }

  makeGuess(letter) {
    if (this.lettersGuessed.includes(letter)) return;

    this.lettersGuessed.push(letter);
    if (this.word.includes(letter)) {
      this.word.forEach((char, idx) => {
        if (char === letter) this.currentWord[idx] = letter;
       });
    } else {
      this.incorrectGuesses++;
    }

    if (!this.currentWord.includes(' ')) this.hasWon = true;
    if (this.incorrectGuesses >= Game.MAX_GUESSES) this.hasLost = true;
  }

  getNewWord() {
    if (this.hasWon) return new Game();
  }

  showState() {
    for (let key in this) {
      console.log(`${key}: ${this[key]}`);
    }
    console.log('\n');
  }

  #setWord() {
    return this.word.map(_ => ' ');
  }
}

// class PlayGame {
//   constructor() {
//     this.game = new Game();
//   }

//   start() {
//     let game = this.game;
//     while (game.word) {
//       game.showState();
//       console.log
      
//     }
//   }
// }

/*
- Need to create a `playGame` class where...
  - create an instance of `playGame` where I have a property -> this.game
    - set it to a newly instantiated Game class object

  - have a start method that contains a loop
    - Within the loop I'll show the game State
    - I'll ask the user to make a guess
      - This guess will be passed as an arg to game.makeGuess(guess)
    - based off the hasWon or hasLost states I can either
      - Tell them that they lost and ask if they want to play another game
        with a new word
      - Tell them that they won and ask if they want to play the next word
      - If they guess all words, let them know there are no more words and 
        finally exit the loop
*/

// let newGame = new Game();
// newGame.showState();