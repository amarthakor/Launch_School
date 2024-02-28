=begin
Write a method that takes a string, and returns a new string in 
which every character is doubled.

Examples:
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''


--- P
- Given: string
- RETURN: return the same string, except each char is doubled
  - whitespaces should be doubled as well
  - if string is empty, return empty string
  - keep case the same

--- E
repeater("Good job!") == "GGoooodd  jjoobb!!"

--- D
beginning: string
intermediate: array to modify each char easily
end: string

--- A
- CONVERT string to array of chars
- TRANSFORM array of chars where
  - for each char, double it
- CONVERT transformed array back into string

=end

def repeater(string)
  string.chars.map { |char| char * 2}.join
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''