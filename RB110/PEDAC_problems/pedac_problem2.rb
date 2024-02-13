=begin
Write a method that takes an array of consecutive letters as input and
returns the missing letter.

p determine_missing_letter(['a','b','c','d','f']) == 'E'
p determine_missing_letter(['o','q','r','s']) == 'P'
p determine_missing_letter(['H','J','K','L']) == 'i'
p determine_missing_letter([]) == []

--- P
- Create a method that takes an array of individual letters and returns the missing letter
 INPUT: array of strings
 OUTPUT: string

 - If argument array is empty, return empty array
 - If argument array is uppercase, return lowercase letter
 - If argument array is lowercase return uppercase letter


--- E
- p determine_missing_letter(['a','b','c','d','f']) == 'E'
    - 'a, b, c, d, __, f' == 'E' is missing
        - since passed array is lowercase, return value is uppercased

--- D
- beginning: array
- intermediate: perhaps use comparison array to compare values of given
    -array vs an array with entire alphabet?
- ending: array to return missing value


--- A
- CREATE a results array
  - initialize a variable to hold our results
    - results_array = []
- CREATE a comparison alphabet array
  - Use a range of the first char to the last char
    - (array.first..array.last).to_a?
- SELECT the missing letter
  - for each character, compare the given array to our comparison array
  - if the given char does not equal our comparison char, select that value
    - given_char != comparison_char
    - missing_letter << comparison_char
- RETURN the missing letter with opposite case
  - if the char is uppercase, transform it to lowercase
    - #downcase?
  - if the char is lowercase, transform it to uppercase
    - #upcase?

=end

def determine_missing_letter(array)
  return [] if array.empty?
  missing_letter = ''
  alphabet_array = (array.first..array.last).to_a

  alphabet_array.each do |char|
    missing_letter << char if array.include?(char) == false
  end

  array.first == array.first.downcase ? missing_letter.upcase : missing_letter.downcase
end

p determine_missing_letter(['a','b','c','d','f']) #== 'E'
p determine_missing_letter(['o','q','r','s']) #== 'P'
p determine_missing_letter(['H','J','K','L']) #== 'i'
p determine_missing_letter([]) #== []