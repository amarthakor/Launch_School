def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  p number
end

times(5) { |num| puts num }

# 0 output to display
# 1 output to display
# 2 output to display
# 3 output to display
# 4 output to display
# => 5 return value of #times()