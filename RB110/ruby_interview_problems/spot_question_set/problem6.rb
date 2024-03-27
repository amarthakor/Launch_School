=begin
Given a string of integers, return the number of odd-numbered substrings
that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 
1341, a total of 7 numbers.

solve("1341") = 7. See test cases for more examples.

Problem: Given a string, return an integer

Rules:
- Return integer represents the number of odd substrings that can be formed
  from the main string
- Given string is a string representation of an integer
- Looking for all odd substrings

Algorithm:
- CREATE an array of all substrings
- TRANSFORM these substrings into integers
- SELECT all the odd substrings
- COUNT the odd substrings
=end

def solve(string)
  substrings = []

  string.size.times do |start_idx|
    start_idx.upto(string.size - 1) do |end_idx|
      substrings << string[start_idx..end_idx]
    end
  end

  substrings.map! {|num| num.to_i }

  substrings.select {|num| num.odd? }.count
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28