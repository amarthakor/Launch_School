// Write a function that returns the highest scoring word from a string. Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc. If two words score the same, return the word that appears first in the original string.

/*
-- Problem --
INPIT: string
OUTPUT: return a string

Rules:
  - Given a string
  - Return the highest scoring word
    - Score is computed by each letter of a word
    - Each letter has its own score point
    - Add up points from all letters which is the words total score
  - If there are two+ words w/ the same score, return the first appearing word

Assumptions:
- If given an empty string, how do we proceed?
  - Return an emty string
- What about one word strings / one char strings?
  - Return the one word / one char
- Does whitespace count as having a score?
  - No
- So how should we return a ' ' or a string with only '      '?
  - Return an empty string if no words are in the string
- What about words with mixed case?
  - Mixed case can occur, point total is the same
- Should we return words in their original case?
  - Yes
- How to handle non string arfs?
  - Return null

-- Examples --
- Given ('man i need a taxi up to ubud')
  - Ned to find highest point word
  -> a:1, b:2, c3, d4, e5, f6... z:26
  - t = 18 a 1 x 23 i 10 = 52 total points
  -> taxi as highest ranked word

- Given 'aa b'
  - 'aa' = 2, 'b', = 2
  - return first of equal points
  -> 'aa'

-- DATA STRUCTURES --
- Can use a a string to find points for letter ( a index 0 + 1, z index 25 + 1)
- split strings into words
- also iterate over each word to find total word point value

-- Algorithm -- 
1. Handle invalid cases
3. Split string into array of words
  - #split
4. Find the total score for each word, set highest score word to variable ** Helper

5. REturn highest scoring word

Helper func findwordscore
1. Find the total score for each word, set highest score word to variable ** Helper
- Set highestScore to neg infinity
- Set highscoreword to ''
- For each word
  - Init totalScore to 0
  - For each char in the current word
    - Find the score of the current char (lowercase) and increment the total score
      only if the score is greater than 0 (-1 means nonalpha char)
  - If the totalScore for the current word is higher than the highestScore
    - Reassign highscoeword to the current word
- Return the highest scoring word

# when finding score need index of letter + 1
# need to convert the current char to a lowercase to find its index to account for case
*/

function highestScoringWord(string) {
  if (typeof string !== 'string') return null;

  let words = string.split(' ');
  let topWord = findWordScore(words);
  return topWord;
}

function findWordScore(words) {
  const ALPHABET = 'abcdefghijklmnopqrstuvwxyz';
  let highestScore = -Infinity;
  let highestScoreWord = '';

  words.forEach(word => {
    let totalScore = 0;
    word.split('').forEach(char => {
      if (/[a-z]/i.test(char)) totalScore += ALPHABET.indexOf(char.toLowerCase()) + 1;
    });

    if (totalScore > highestScore) {
      highestScore = totalScore;
      highestScoreWord = word;
    }
  });

  return highestScoreWord;
}

// console.log(findWordScore(['man', 'i', 'need', 'a', 'taxi', 'up', 'to', 'ubud']));
// Test cases
console.log(highestScoringWord('')); // ''
console.log(highestScoringWord('man i need a taxi up to ubud')); // === 'taxi'
console.log(highestScoringWord('what time are we climbing up the volcano')); // === 'volcano'
console.log(highestScoringWord('aa b')); // === 'aa
console.log(highestScoringWord('aa b', 'aaaaa')); // === 'aa'
console.log(highestScoringWord(123)); // === null
console.log(highestScoringWord('a(*&A b!@#$')); // === 'a(*&A'
console.log(highestScoringWord('what time    are we climbing up the     volc@no')); // === 'volc@no'
console.log(highestScoringWord('what time are we climbing up the VOLcanO')); // === 'VOLcanO'