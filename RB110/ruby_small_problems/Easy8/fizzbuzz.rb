=begin
Write a method that takes two arguments: the first is the starting number,
and the second is the ending number. Print out all numbers from the starting
number to the ending number, except if a number is divisible by 3, print "Fizz",
if a number is divisible by 5, print "Buzz", and finally if a number is divisible
by 3 and 5, print "FizzBuzz".

Example:
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz


--- P
- Given: 2 arguments, both integers, starting number and ending number
- RETURN: print all numbers from start_num to end_num
          - if a number is divisble by 3, print 'Fizz' instead
          - if a number is divisble ny 5, print "Buzz" instead
          - if a num is divisible by 3/5, print 'fizzbuzz'
  

--- E
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
  - 3, 6, 9, 12, ->fizz
  - 5, 10, -> buzz
  - 15 -> fizzbuzz
  -1, 2, 4, 7, 8, 11, 13, 14, 

--- D
-beginning: two integers
intermediatE: array to iterate over collection of nums and transform the values
end: string

--- A
- CREATE an array of integers starting at arg1 and ending at arg2
- TRANSFORM integers within array according to rules described above
  - factors of 3 -> Fizz
  - factors of 5 -> Buzz
  - factors of 3/5 -> FizzBuzz
- PRINT transofrmed array to console


=end

def fizzbuzz(start, stop)
  (start..stop).to_a.map do |num|
    case
      when num % 3 == 0 && num % 5 == 0 then 'FizzBuzz'
      when num % 3 == 0 then 'Fizz'
      when num % 5 == 0 then 'Buzz'
      else num
    end
  end.join(', ')
end

puts fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz