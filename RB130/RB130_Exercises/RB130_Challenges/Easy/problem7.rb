# Implement octal to decimal conversion. Given an octal input string, your 
# program should produce a decimal output. Treat invalid input as octal 0.
# 5:25pm - 6:11pm
# Note: Implement the conversion yourself. Don't use any built-in or 
# library methods that perform the necessary conversions for you. 
# In this exercise, the code necessary to perform the conversion 
# is what we're looking for.

# About Octal (Base-8)

# Octal numbers use a base-8 system. A number 233 in base 8 can be understood
# as a linear combination of powers of 8:

# The rightmost digit gets multiplied by 8^0 = 1
# The next digit gets multiplied by 8^1 = 8
# The digit after that gets multiplied by 8^2 = 64
# The digit after that gets multiplied by 8^3 = 512
# ...
# The n*th* digit gets multiplied by 8n-1.
# All of these values are then summed.

# Thus:

# 233 # octal
# = 2*8^2 + 3*8^1 + 3*8^0
# = 2*64  + 3*8   + 3*1
# = 128   + 24    + 3
# = 155

=begin
--- P
Problem: Given a string number, return an integer of the num in base 10

Rules:
- Given string representation of integer, need to return integer
- Octal number needs to be converted to base 10 number
- RETURN 0 if any digits are not 0-7

--- E


--- D
array to hold digits of of argument

--- A
- Create constructor that takes 1 argument
  - assign @base8 to argument
- CREATE instance method #to_decimal that takes no arguments
  - RETURN 0 if any of the chars of @bas8 are not 0-7 integers
    - ITERATE over an array of chars
      - for each char
        - is the current char between 0-7 AND nonalphabetical?
    - if any false values, return 0
  - SET base10 to 0
  - CONVERT base8 to integer array
    - map! to_i
  - ITERATE over arr of integers and indexs
    - for each integer and idx
      - increment base10 by (integer) * (8^index)
  - RETURN base10 value

=end

class Octal
  attr_reader :base8

  OCTALS = [0, 1, 2, 3, 4, 5, 6, 7]
  def initialize(value)
    @base8 = value.chars
  end

  def to_decimal
    return 0 if valid_number?(base8)
    base10 = 0
    number = convert_to_integer

    number.digits.each_with_index do |digit, power|
      base10 += digit * (8**power)
    end

    base10
  end

  private

  def valid_number?(number)
    number.map do |char|
      OCTALS.include?(char.to_i) && char.to_i.to_s == char
    end.any?(false)
  end

  def convert_to_integer
    base8.join.to_i
  end
end

p Octal.new('233').to_decimal