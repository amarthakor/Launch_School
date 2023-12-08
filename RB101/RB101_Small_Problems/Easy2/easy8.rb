# write a program that asks the user to enter an integer > 0, then asks if the user
# wants to determine the sum(+) or product(*) of all numbers between 1
# and the entered integer

def gets_num
  puts "Please enter an integer greater than 0"
  num = gets.chomp.to_i
end

def sum_or_product(num)
  puts "Please enter 's' to compute the sum, 'p' to compute the product."
  s_or_p = gets.chomp.downcase

  if s_or_p == 's'
    puts "The sum of the integers between 1 and #{num} is #{calc_sum(num)}"
  else
    puts "The product of the integers between 1 and #{num} is #{calc_product(num)}"
  end
end

def calc_sum(num)
  numbers = (1..num).to_a
  numbers.inject(:+)
end

def calc_product(num)
  numbers = (1..num).to_a
  numbers.inject(:*)
end

num = gets_num
sum_or_product(num)
