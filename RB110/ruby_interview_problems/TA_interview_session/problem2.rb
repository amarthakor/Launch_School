=begin
# Write a function that masks proper nouns and numbers in a sentence. 
Use * to mask proper nouns and use # to mask numbers. You may assume that a 
sentence will not begin with a proper noun and will not end with a number 
or proper noun. Numbers can only be integers.

# # Test cases
# puts mask_sentence("They bought 5 apples from John yesterday.")  
# They bought # apples from **** yesterday.
# puts mask_sentence("Alice and Bob went to Paris in 2021 to have a vacation.") 
# Alice and *** went to ***** in #### to have a vacation.

# puts mask_sentence("They bought 5 apples from John yesterday.")
# puts mask_sentence("Alice and Bob went to Paris in 2021 to have a vacation.")

--- P
- given: string
- return: return a modified string where;
        - proper nouns and numbers are masked 
        - an * will be used to mask proper nouns
        - a # will be used to mask numbers
        - sentence will not begin w/ a proper noun or end w/ proper noun or number
        - numbers can only be integers

- what is a proper noun?
  - looks like for the context of this problem, all proper nouns are 
    capitalized. So a noun like 'apples' is a noun but not a PROPER noun.
- looks like technical proper nouns are not counted as proper nouns if they
  start off the sentence

--- E
- mask_sentence("They bought 5 apples from John yesterday.") -> 
  They bought # apples from **** yesterday.
  - propernouns or numbers found: 5, apples, John
  -> They bought # ****** from **** yesterday.

- mask_sentence("Alice and Bob went to Paris in 2021 to have a vacation.") ->
  Alice and *** went to ***** in #### to have a vacation.
  - proper ouns or numbers: Alice, Bob, Paris, 2021
    - ***** and *** went to ***** in #### to have a vacation.
  - is Alice not a proper noun? or are proper nouns that are the first word not
    converted into *?
--- D
beginning: string
middle: iterate over string chars
end: modified string

--- A
- CREATE an array of integer numbers
- TRANSFORM the string into an array of words
- REMOVE and SAVE the leading element-word to a variable palce holder
- ITERATE over the string where
  - for each element-word
    - if the word is capitalized
      - TRANSFORM the string into '*' multipled by the word size
    - if it includes one of the integer numbers
      - ITERATE over each char in the number and transform each digit into a '#'
    - else
      - keep it the same
- PREPEND the previously saved first element word
- RETURN hte modified string

=end

NUMBERS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def mask_sentence(string)
  string = string.split
  first_word = string.shift
  new_sentence = mask_noun_number(string, first_word)
end

def mask_noun_number(array, lead_word)
  array.map do |word|
    if word.chars.map { |num| NUMBERS.include?(num) }.all?
      '#' * word.size 
    elsif word == word.capitalize
      '*' * word.size
    else
      word
    end
  end.prepend(lead_word).join(' ')
end

p mask_sentence("They bought 5 apples from John yesterday.") ==
               "They bought # apples from **** yesterday."
p mask_sentence("Alice and Bob went to Paris in 2021 to have a vacation.") == 
                "Alice and *** went to ***** in #### to have a vacation."