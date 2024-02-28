=begin
A double number is a number with an even number of digits whose left-side
digits are exactly the same as its right-side digits. For example, 44, 3333, 
103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, 
unless the argument is a double number; double numbers should be returned as-is.

Examples:
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

--- P
- GIVEN: integer
- RETURN: integer doubled UNLESS
        - if the number is a double number, leave it alone
        - doulbe number are any numbers that split down the middle are the same
        - on both sides, they are not mirror images, thus integers with
        - and odd amount of digits cannot be double numbers
- if argument has special characters, do not consider these characters
--- E
37, 3 | 7, == 74
44, 4 | 4, == 44
444, odd digit number, == 888

--- D
begining: integer 
intermediate: array to evaluate first half vs second half of integer
ending: integer


--- A
- RETURN integer * 2 if the number of digits in integer is odd
- CONVERT integer to string 
- FIND first half of string
- FIND second half of string
- If first half string == second half string
  - return num.to_i
- otherwise
  - return num.to_i * 2
=end

def twice(num)
  return num * 2 if num.digits.size.odd?
  num = num.to_s
  first_half = num[0..num.size / 2 - 1]
  second_half = num[num.size / 2..-1]
  first_half == second_half ? num.to_i : num.to_i * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10