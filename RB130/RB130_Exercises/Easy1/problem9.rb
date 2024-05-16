# Write a method called one? that behaves similarly 
# for Arrays. It should take an Array as an argument, 
#   and a block. It should return true if the block 
#   returns true for exactly one of the element values. 
#   Otherwise, it should return false.

# Your method should stop processing elements of the 
# Array as soon as the block returns true a second time.

# If the Array is empty, one? should return false, 
# regardless of how the block is defined.

# Your method may not use any standard ruby method 
# that is named all?, any?, none?, or one?.

def one?(numbers)
  true_count = []

  numbers.each do |num| 
    true_count << true if yield(num)
    return false if true_count.size > 1
  end

  true_count.empty? ? false : true
end

puts one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
puts one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
puts one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
puts one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
puts one?([1, 3, 5, 7]) { |value| true }           # -> false
puts one?([1, 3, 5, 7]) { |value| false }          # -> false
puts one?([]) { |value| true }                     # -> false