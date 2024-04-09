=begin
Given a String as an argument, return an Array of all consecutive numbers from the String.
Consecutive numbers being: a series of numbers containing no other non-numeric characters.
Consecutive numbers must be larger than 1 digit, otherwise do not add these to the returned array.
Note: Spaces DO NOT break a series of numbers

p numbers_from_string('Ruby3.32') = [32]
p numbers_from_string('abc1234abc') == [1234]
p numbers_from_string('11abc1!23abc') == [11, 23]
p numbers_from_string('hello world!') == []
p numbers_from_string('1 2 3 4') == [1234]
p numbers_from_string('12abc7f24ghi1678!') == [12, 24, 1678]
=end


=begin
Given a string that includes alphanumeric characters ("3a4B2d") return the 
expansion of that string: The numeric values represent the occurrence of each 
letter preceding that numeric value. There should be no numeric characters in the 
final string.

p str_expansion("3D2a5d2f") == "DDDaadddddff"
p str_expansion("3abc") == "aaabbbccc"
p str_expansion("3d332f2a") == "dddffaa"