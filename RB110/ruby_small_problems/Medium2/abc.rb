=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that 
do not use both letters from any given block. Each letter in each block can 
only be used once.

Write a method that returns true if the word passed in as an argument can be 
spelled from this set of blocks, false otherwise.

Examples:
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true


--- P
 - given: string
 - return: boolean true or false where
          - given 13 spelling blocks
            - 2 letters per block, total of 26 letters
          - limits word that we can produce on the basis of
            - cannot use both letters from any given block
            - each letter in each block can only be used once
          - return true/false based on if string arg passed
            can be spelled from this set of blocks, false otherwise

- each letter is uniq, tehre are no duplicates
- assume string will never be empty or contian nonalpha chars
--- E
- block_word(BATCH) == true
  - 5 spelling block pairs
    - B:O
    - N:A
    - G:T
    - C:P
    - H:U
    - BATCH all one letter from different blocks == true

- -BUTCH == FALSE
  - B:O, H:U, G:T, C:P, H:U
    - H:U block appears twice in order to make word
      - therefore this returns false


--- D
beginning: string
intermediate: hash to make pairs and also count each time a K_V pair has been used? 
              array to iterate over string chars
ending: boolean T/F

--- A
- CREATE A hash of spelling block pairs
- CREATE an array empty array to count the amount of pairs used in a string
- ITERATE over the string
  - convert into array of chars
  - for each character
    - if the current char is a key 
      - append the respective k-v pair to the array
    - if the current char is a value
      - find the respective kv pair and append it to the array
- COUNT each value in the array
  - if any element appears twice
    - return false
  - otherwise return true

=end
SPELLING_BLOCKS = { 'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P', 'N' => 'A',
                  'G' => 'T', 'R' => 'E', 'F' => 'S', 'J' => 'W', 'H' => 'U',
                  'V' => 'I', 'L' => 'Y', 'Z' => 'M' }

def block_word?(string)
  block_pairs = []

  find_pairs(string, block_pairs)
  
  block_pairs.map { |pair| block_pairs.count(pair) }.all?(1)
end

def find_pairs(string, array)
  string.upcase.chars.each do |char|
    if SPELLING_BLOCKS.key?(char)
      array << {char => SPELLING_BLOCKS[char]}
    elsif SPELLING_BLOCKS.value?(char)
      array << {SPELLING_BLOCKS.key(char) => char}
    end
  end
end

p block_word?('BATCH') == true #true
p block_word?('BUTCH') == false #true
p block_word?('jest') == true   #true