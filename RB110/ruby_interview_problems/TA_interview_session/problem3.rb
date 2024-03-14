=begin
# # Write a function, negate, that converts all “yes” words to "no" and "no" 
words to "yes" in a sentence. The comparison for "yes" and "no" should be case 
insensitive."yes" and "no" should be negated even if ending with ., ?, ,, or !.

# # Test cases
# puts negate("Yes, I said no but now I say yes.") # "No, I said yes but now I say no."
# puts negate("no way, yes way!") # "yes way, no way!"
# puts negate("Yesterday is not today?") # "Yesterday is not today?"
# puts negate("No, I do not know!") # "Yes, I do not know!"
3:41 - 4:04, 23mins
--- P
- given: string
- return: modified string where;
          - all occurrences of 'yes' are transformed to 'no'
          - all occurrences of 'no' are transofrmed to 'yes'
          - case does not matter
          - switches should still occur even if 'no'/'yes' end in . ? , or !

--- E
- # puts negate("Yes, I said no but now I say yes.") # "No, I said yes but now I say no."
  - occurrences of key words: 'Yes,', 'no' 'yes.' -> 'No,', 'yes', 'no.'
    -> 'No,' I said yes but now I say no. == "No, I said yes but now I say no."

- # puts negate("no way, yes way!") # "yes way, no way!"
  - occurrences of keywords: 'no', 'yes' -> 'yes', 'no'
    -> yes way, no way! == yes way, no way!

--- D
begining: string
middle: array to iterate over each word and apply some type of modification or i can use
          a hash w/ key value pairs to perform swaps, maybve both?
ending: modified string

--- A
- CREATE a swap hash of all yes -> no, no-> yes, Yes-> no.. etc.
- CONVERT the string into an array of words
- TRANSFORM the string where
  - for each word
  - if the current word is a key contained in the swap_hash
    - leave the value 
  - otherwise
    - leave the current word alone
- CONVERT my array of words back into a string
=end

SWAP_WORDS = { 'yes' => 'no', 'no' => 'yes', 'Yes' => 'No', 'No' => 'Yes', 'Yes,' => 'No,',
                'Yes!' => 'No!', 'Yes.' => 'No.', 'Yes?' => 'No?', 'No,' => 'Yes,',
                'No.' => 'Yes.', 'No?' => 'Yes?', 'No!' => 'Yes!', 'yes.' => 'no.',
                'yes!' => 'no!', 'yes?' => 'no?', 'yes,' => 'no,', 'no!' => 'yes!', 
                'no.' => 'yes.', 'no?' => 'yes?', 'no,' => 'yes,' }

def negate(string)
  string.split.map do |word|
    SWAP_WORDS.keys.include?(word) ? SWAP_WORDS[word] : word
  end.join(' ')
end

p negate("Yes, I said no but now I say yes.") == "No, I said yes but now I say no."
p negate("no way, yes way!") == "yes way, no way!"
p negate("Yesterday is not today?") ==  "Yesterday is not today?"
p negate("No, I do not know!") == "Yes, I do not know!"