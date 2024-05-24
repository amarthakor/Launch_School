# Write a program that will take a string of digits and return all the possible
# consecutive number series of a specified length in that string.
# 12:08pm
# For example, the string "01234" has the following 3-digit series:

# 012
# 123
# 234

# Likewise, here are the 4-digit series:

# 0123
# 1234

# Finally, if you ask for a 6-digit series from a 5-digit string, you
# should throw an error.
=begin
--- P
Problem: Given a string number and integer argument, return an array or raise an error

Rules:
- Given a string number
- Specified an integer representing the series
- Return an array of arrays where
  - Each array is a number with as many digits as specified by the argument
- Raise an error if the specified number is larger than the size of the string

--- E
('01234').slice(1) -> [[0], [1], [2], [3], [4]]
  - Given a string num 5 digits long
  - Argument specified is 1
  - Thus return every series of numbers that is at least 1 digit long

('01234').slice(3) -> [[0, 1, 2], [1, 2, 3], [2, 3, 4]]
  - Given string 5 digits long
  - Need series of 3 digits long
  - Thus return all series but stop collecting at 2, since any series after
    that is no longer 3 elements long

--- D
array

--- A
- CREATE Constructor that takes 1 argument, the given number
- CREATE one instance method, #slice() that takes one argument
  - Argument specifies how long each series should be
  - RAISE error if #slice argument is > than given number size
  - CREATE array to hold all series
  - FIND all valid series
    - ITERATE as many times as the string size - the length of the series
      - for each iteration
        - start iterating upto the length of series - 1 index
          - append the start_idx..length_of_series - 1 into the series array
    - Increment both indicies by 1
  - CONVERT all elements in the holder array into integers
=end

# class series
class Series
  attr_reader :number

  def initialize(value)
    @number = value
  end

  def slices(length)
    raise ArgumentError if number.size < length

    series = []
    iterations = number.size - length
    end_idx = length - 1

    0.upto(iterations) do |start_idx|
      series << number.chars[start_idx..end_idx]
      end_idx += 1
    end

    series.map { |subarr| subarr.map(&:to_i) }
  end
end
