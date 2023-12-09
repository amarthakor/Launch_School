# Write another method that returns true if the string passed as an argument
# is a palindrome, false otherwise. This time, however, your method should
# be case-insensitive, and it should ignore all non-alphanumeric characters.

def real_palindrome?(message)
  message.downcase.delete('^a-z' '^0-9') ==
  message.reverse.downcase.delete('^a-z' '^0-9')
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false