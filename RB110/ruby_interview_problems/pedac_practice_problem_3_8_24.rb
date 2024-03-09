=begin
We're receiving a set of messages in code. The messages are sets of text 
strings, like:
"alakwnwenvocxzZjsf"
Write a method to decode these strings into numbers. The decoded number 
should be the number of lowercase characters between the first two uppercase 
characters. If there aren't two uppercase characters, the number should be 0.

Test cases:
p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
p decode([]) == []

--- P
- GIVEN: array of strings
- RETURN: array of integers

      - return 0 if an element has no uppercase letters
      - number is found by counting chars between the first two uppercase chars
      - if there are 2 chars uppercased w/ no lowercase in between
        return 0
      - if string has more than 2 uppercase chars, only work with chars from
        firstuppercase..seconduppercase
---- E
- p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
  - first element
    - 'U'rs'C' = 2 undercase chars, figure out how to stop once 2 uppercase have
    been identified
    - 'heLlo' -> 0 because str doesn't have two uppercase chars
    - 'XX' -> 2 uppercase chars but none in between so return 0
---- D
begin: array of strings
intermediate: stay within array to work on each element and satisfy problem req's
end: array of integers


--- A
- RETURN empty array if given array is empty
- INITIALIZE results array
- INITIALIZE lowercase chars variable to represent lowercase chars between two uppercase
- INITIALIZE upperchase chars to represent the amount of uppercase chars encoutnered 
  so far in the given string
- COUNT the number of lowercase chars between two uppercase chars
  - ITERATE over each string
    - in each string, iterate over every char
      - if the current char is uppercase
        - increment uppercase count by +=1
      - if the current char is lowercase and uppercase count is > 0
        - increment lowercase count by +=1
      - if uppercase count is equal to 2, break out of the loop
      - at the last char in the string, if uppercase count is less than 2
        - assign lowercase count to 0
    - at the end of the string iteration
      - append the current value of lowercase_count to results array
      - reassign uppercase_count and lowercase_count to 0 
- RETURN results array
=end

def decode(array)
  return [] if array == []
  results_arr = []

  array.each do |str|
    uppercase_count, lowercase_count = 0, 0

    str.chars.each_with_index do |letter, idx|
      break if uppercase_count == 2
      uppercase_count += 1 if letter == letter.upcase
      lowercase_count += 1 if uppercase_count > 0 && letter == letter.downcase
      lowercase_count = 0 if idx == (str.size - 1) && uppercase_count < 2
    end

    results_arr << lowercase_count
    lowercase_count, uppercase_count = 0, 0
  end

  results_arr
end


p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
p decode([]) == []