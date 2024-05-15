def each(array)
  counter = 0
  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

p each([1, 2, 3]) { |num| puts "#{num} hi" }

# 1 hi output to display
# 2 hi output to display
# 3 hi output to display
# => [1, 2, 3] returned by #each() method