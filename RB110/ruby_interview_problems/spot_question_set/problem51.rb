=begin
Reverse or rotate?
The input is a string str of digits. Cut the string into chunks 
(a chunk here is a substring of the initial string) of size sz
(ignore the last chunk if its size is less than sz).
If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2,
 reverse that chunk; otherwise
rotate it to the left by one position. Put together these modified chunks and return the 
result as a string.
If
sz is <= 0 or if str is empty return ""
sz is greater (>) than the length of str it is impossible to take a chunk of 
size sz hence return "".



Examples:
revrot("123456987654", 6) --> "234561876549"
revrot("123456987653", 6) --> "234561356789"
revrot("66443875", 4) --> "44668753"
revrot("66443875", 8) --> "64438756"
revrot("664438769", 8) --> "67834466"
revrot("123456779", 8) --> "23456771"
revrot("", 8) --> ""
revrot("123456779", 0) --> ""
revrot("563000655734469485", 4) --> "0365065073456944"


Problem: Given a string and an integer, return a string

Rules:
- IF string is empty or negative, return empty string ''
- IF size (integer arugment) is greater than the str size, return empty string ''

- Given string and an integer
  - Make substrings of the string that are integer length
  - Disregard any last substring that are not integer length
    - THEN for EACH integer sized substring
      - IF the SUM of the DIGITS cubed (^3) of a substring are disvible by 2
        - REVERSE that chunk
      - OTHERWISE
        - rotate it to the left by one position
- THEN JOIN these transofmred substrings and return the result

- what does rotate mean?
  - assume shift every digit in substring to the left by one index

Algorithm:
- RETURN '' if string is empty, size is negative or 0, or size is greater than string size
- CREATE an array to hold all substrings
- FIND all integer sized substrings
  - ITERATE over an array of digits
    - CREATE all integer sized substrings
      - start from index 0..integer size - 1, then move onto the next chunk
- CONVERT all substrings into integers
- TRANSFORM all substrings
  - IF current substring digits cubed sum is evenly divibsle by 2
    - reverse the chunk
  - otherwise
    - rotate substring to left by one posistion
- JOIN array of substrings
=end

def revrot(number, size)
  return '' if number.empty? || size <= 0 || size > number.size
  substrings = []
  str_idx, end_idx = 0, size - 1

  (number.size / size).times do |_|
    substrings << number[str_idx..end_idx]
    str_idx += size 
    end_idx += size
  end

  substrings.map do |number|
    if number.to_i.digits { |num| num**3 }.sum % 2 == 0
      number.to_s.reverse
    else
      number = number.to_s[1..-1] + number.to_s[0]
    end
  end.join

end


p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == ""
p revrot("123456779", 0) == ""
p revrot("563000655734469485", 4) == "0365065073456944"