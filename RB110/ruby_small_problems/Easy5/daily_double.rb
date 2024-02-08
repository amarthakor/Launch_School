# Write a method that takes a string argument and returns a new string that
# contains the value of the original string with all consecutive duplicate
# characters collapsed into a single character. 
# You may not use String#squeeze or String#squeeze!.

# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''

=begin
--- P
- Given a string argument, return a new string that:
  - Reqs: remove all consecutive duplicate characters

--- E
- crunch('ddaaiillyy ddoouubbllee') == 'daily double'

--- D
- we can use an array to iterate over each char

--- A
- CREATE an array of individual chars of string
  - array.split or array.chars
- REMOVE all duplicate chars
  - iterate over each character
  - check if the current char is NOT the same as the next char, select the current char
    - initialize a counter to 1 to compare the current char to the next char
      - append the current char IF current_char != IS NOT EQUAL to the next char
       - increment counter by 1 each iteraiton
- RETURN new string
  - transform current array into string
    - #join?
=end

def crunch(string)
  string = string.chars
  new_string = []
  counter = 1

  string.map do |char|
    new_string << char if char != string[counter]
    counter += 1
  end

  new_string.join
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''