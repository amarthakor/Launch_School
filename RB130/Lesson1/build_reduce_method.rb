# Try to write a reduce method on your own that exhibits this behavior. Your reduce should take at least 1 argument that represents the array we'll operate on. It should also take an optional second argument that represents the default value for the accumulator. Here's a few examples that we should be able to call on your method.

# - create reduce/inject method
#   - method should take one argument
#   - should also consider 2nd optional argument that sets
#      default value at 2nd argument and increments upwards
#   - need to iterate through all elemtns of array
#   - returns the sum of all integers within array

def reduce(array, start=0)
  counter = 0
  total = start

  while counter < array.size
    total = yield(total, array[counter])
    counter += 1
  end

  total
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }        # # => NoMethodError: undefined method `+' for nil:NilClass