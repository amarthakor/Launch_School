# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongst the first 5 numbers.
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

def get_num(num)
  puts "==> Enter the #{num} number:"
  gets.chomp.to_i
end

def number_present?(array, six)
  if array.include?(six)
    puts "The number #{six} appears in #{array}"
  else
    puts "The number #{six} does not appear in #{array}"
  end
end

first = get_num('1st')
second = get_num('2nd')
third = get_num('3rd')
fourth = get_num('fourth')
fifth = get_num('fifth')
sixth = get_num('sixth')

array_of_nums = []
array_of_nums << first
array_of_nums << second
array_of_nums << third
array_of_nums << fourth
array_of_nums << fifth

number_present?(array_of_nums, sixth)