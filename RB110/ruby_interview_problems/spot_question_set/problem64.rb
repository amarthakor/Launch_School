=begin

Write a function with the signature shown below:
def is_int_array(arr)
true
end


returns true / True if every element in an array is an integer or a float with no decimals.
returns true / True if array is empty.
returns false / False for every other input.



=end


def is_int_array(numbers)
  return true if numbers.empty?

  numbers.map! do |num|
    (num.class == Integer || num.class == Float && num.to_i == num) ? true : false
  end.all?(true)
 
end

p is_int_array([1, 2, 3, 4]) # == true
p is_int_array([1.0, 2.0, 3.0]) # == true
p is_int_array([1.1, 2.2, 3]) # == false