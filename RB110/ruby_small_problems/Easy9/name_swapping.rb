=begin
Write a method that takes a first name, a space, and a last name passed as a single String 
argument, and returns a string that contains the last name, a comma, a space, and the first name.

Examples
swap_name('Joe Roberts') == 'Roberts, Joe'

--- P
- GIVEN: String argument
- RETURN: original string argument except
          - first word and last word are swapped
          - there is also a comma added after the first word

- assume given argument is always a string
- assume given argument will never be empty string

--- E
- given: 'Joe Roberts'
  - swap words = roberts joe
  - add comma after first word = roberts, joe
--- D
- beginning:string
intermediate: array to swap element order
end: string

--- A
- CONVERT string into array
- MODIFY the array of words
  - reverse the order of words
- CONVERT the array of words back into a string
  - use a comma whitespace as a separator between words
=end

def swap_name(name)
  name.split.reverse.join(', ')
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'