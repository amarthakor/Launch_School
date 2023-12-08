# Write a method that takes a positive integer argument and returns that # 
# with its digits reversed
#
# P
# INPUT: integer argument
# OUTOUT: argument but in reverse order
# - What happens if a non-int is used?
# - Should we expect floats to work?
# - Is 0 considered positive?
#
# E 
# - Assume only positive integers will be used
# - No need for floats to work as expected
# - 0 should return expected output
# reversed_number(12345) == 54321
# reversed_number(12213) == 31221
# reversed_number(456) == 654
# reversed_number(12000) == 21 # No leading zeros in return value!
# reversed_number(12003) == 30021
# reversed_number(1) == 1
#
# D
# - No DS will be utilized
#
# A
# - Convert integer to string
# - Reverse string 
# - Convert string back to integer
#
# C

def reversed_number(num)
  num.to_s.reverse.to_i
end

# should all output true
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1