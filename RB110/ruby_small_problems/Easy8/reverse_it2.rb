=begin
Write a method that takes one argument, a string containing one or more words, 
and returns the given string with words that contain five or more characters 
reversed. Each string will consist of only letters and spaces. Spaces should 
be included only when more than one word is present.

Examples:
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

--- P
- GIVEN: string
- RETURN: string where words >= 5 are reversd
- keep case the same
- strings will only consist of letters and spaces
- assume string arguments will not be empty
- assume arguments will always be string objects

--- E
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
- words that are less than 5 chars : Walk, the
- words that are greater than 5 chars: around, block
  - these two end up being reversed

--- D
beginning: string
intermediate: array this will allow manipulation and modifcation of each word based
            off given conditions
end: string

--- A
- CONVERT string into array of words
- TRANSFORM string where 
  - for each word, if word.length is >= 5
    - reverse it
- CONVERT array back into string

=end

def reverse_words(string)
  string.split.map { |word| word.length > 4 ? word.reverse : word }.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS