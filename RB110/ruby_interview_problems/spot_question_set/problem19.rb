=begin
A string is considered to be in title case if each word in the string is either 
(a) capitalised (that is, only the first letter of
the word is in upper case) or (b) considered to be an exception and put entirely
into lower case unless it is the first word,
which is always capitalised.
Write a function that will convert a string into title case, given an optional 
list of exceptions (minor words). The list of
minor words will be given as a string with each word separated by a space. 
Your function should ignore the case of the
minor words string -- it should behave in the same way even if the case of the 
minor word string is changed.

Problem: Given a 1 or 2 string arugments, return a new string

Rules:
- Return a string in title case
  - Title case has every word in the string capitalized, EXCEPT m minor words
    - Minor words must be capitlaized if they are the first word in the sentence

- Minor words must be all lower cased, except when first word is aminor word
- All other words must be capitalized


Algorithm:
- IF there is only 1 argument, return a string of every word capitalized
- INITialize a vairable and set to the first word and capitalize it
- CONVERT the second word of the string onwards into an array of words
- ITERATE over the array[1..-1] of words
  - for each word
    - if the current word is included in the second argument
      - downcase it
    - otherwise capitalize the string
- JOIN the array of words into a string
- JOIN the first word to the rest of the string
=end


def title_case(str1, str2 = ())
  return str1.split.map {|word| word.capitalize }.join(' ') if str2 == ()
  first_word = str1.split[0].capitalize 
  str2 = str2.downcase.split

  str1 = str1.split[1..-1].map do |word|
    str2.include?(word.downcase) ? word.downcase : word.capitalize
  end.join(' ')

  "#{first_word} #{str1}"
end

p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'