# Write a program that, given a natural number and a set of one or more other
#  numbers, can find the sum of all the multiples of the numbers in the set
#   that are less than the first number. If the set of numbers is not given,
#    use a default set of 3 and 5.

# For instance, if we list all the natural numbers up to, but not including,
#  20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and
# 18. The sum of these multiples is 78.
=begin

--- P
Problem: Given an integer, return an integer

Rules:
- Return integer is a sum
  - Sum is formed by finding multiples of 3 and 5 upto the given integer - 1
  - IF arguments are provided, use those multipls upto integer - 1
- DONT count duplicate multiples

--- A
- CREATE constructor method
  -@multiples = *multiples
- CREATE class method to calculate sum #to(number)
  - CREATE empty array to hold multiples
  - ITERATE from 1...number
    - append the number if it is evenly divisble by 3 or 5
  - REMOVE duplicates in array
  - SUM array
- CREATE instance method to calculate sum with given multiples #to()
  - CREATE empty array 
  - ITERATE over specified multiples array
    - for each multiple
      - ITERATE upto number - 1
        - append current num if current num is evenly divisble into target_num
    - REMOVE dupleicates ina rray
    - SUM array
=end

class SumOfMultiples
  attr_reader :factors

  def initialize(*multiples)
    @factors = multiples
  end

  def self.to(target)
    SumOfMultiples.new(3, 5).to(target)
  end

  def to(target)
    multiples = []

    factors.each do |factor|
      (1...target).each { |num| multiples << num if num % factor == 0 }
    end.uniq.sum

    multiples.uniq.sum
  end
end

p test = SumOfMultiples.to(1000)
