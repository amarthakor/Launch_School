=begin
5:29pm
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do
not use both letters from any given block. Each letter in each block can only 
be used once.

Write a method that returns true if the word passed in as an argument can be 
spelled from this set of blocks, false otherwise.

Problem: Given a string, return a boolean t/f

Rules:
- Given 13 pairs of spelling blocks, each pairs contain 2 letters of the alphabet
- Thus can only spell words with letters from one block
- Each letter in each block can only be used once
- Return true if the given string arg can be spelled from the blocks
- Return false if the word cannot be spelled from the given blocks
- Case insensitive, treat lowercase chars the same as uppercase chars

Examples
jest == JEST == TRUE

- BATCH -> B:O, N:A, G:T, C:P, H:U
  - B, A, T, C, H

DS: 
Arrays to iterate over pairs and chars

Algorithm:
- CREATE an array of subarrays that contain letter pairs
- CREATE an array of blocks used
- UPPERCASE the string if it isn't already
- ITERATE over an array of chars from the given streing
  - for each char
    - ITERATE over the array of pairs
      - for each pair
        - check if the char is included within the current subarr
          - if true, append the current subarr to the array of used blocks
        - else move onto the next pair
- CHECK if the array size is the same as the array size of all unique values

=end

PAIRS = [['B','O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], ['G', 'T'],
         ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'], ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_word?(word)
  blocks_used = []
  word == word.upcase ? word : word.upcase!

  word.chars.each do |letter|
    PAIRS.each do |pair|
      blocks_used << pair if pair.include?(letter)
    end
  end

  blocks_used == blocks_used.uniq
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true