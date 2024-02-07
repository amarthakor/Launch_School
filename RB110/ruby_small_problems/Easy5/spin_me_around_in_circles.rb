# Given a string, write a method/function which returns the number of 
# characters present in the largest palindrome substring. Palindromes are
# case-insensitive and are at least 2 characters long. If no palindromes
# are present, return -1.

# "supertacocat"  => 7
# "MomAndDad"     => 3
# "Palindrome"    => -1

=begin
--- P
- Write a method that RETURNS the number of characters present in the LARGEST
- palindrome substring. Palindromes consist of string/substrings that are
- spelled the same forwards as they are BACKWARDS/REVERSE.
    - Palindrome requirements:
            - spelled the same forwards and backwards/REVERSE
            - At least 2 characters long
            - case - insensitive
    - If no palindrome present, RETURN -1

  - INPUT: string
  - OUTPUT: integer representing the largest palindromic substring size
--- E
"MomAndDad" => "Mom" == "moM" 3 chars long, "Dad" == "daD" 3 chars long
return 3

--- D
 - utilize array to hold all values that are palindromic substrings
    - can also compare all substrings within array for size

--- A
- CREATE an array of all possible substrings
  -initialize an array for substrings
  - iterate through each character 
    - use 'times' method, using each iteration as the starting index
  - for each character, push all substrings in an array (#push? #<<)
    - use 'upto' method, using each iteration as the range of chars
    - decrement max range by -1 for each new character
- SELECT substrings that are palindromes
  - palindromes are the same forward/reversed, case insensitive, more than 1 char
  - iterate through 'substrings' array and select all palindromes
    - intialize 'palindormes' array to hold all selected words
    - check if each substring lowercased is == to the substring lowercased and reversed
        - word.dowcase == word.downcase.reverse?
- TRANSFORM the number of chars in each palindrome
  - assign new variable palindromic_max to return array 
    - for each palindromic word, count the chars in the word
      - word.count? .size? .length?
- RETURN -1 if there are no palindromic words
  - if palindromic array is empty? return -1
- RETURN the largest count
    - return the max/largest integer element in the transformed array
        - palindromic_count.max?




=end

def longest_palindrome(string)
  substrings = []
  last_char = string.size
  
  string.size.times do |current_idx|
    1.upto(last_char) do |range|
      substrings << string[current_idx, range]
    end
    last_char - 1
  end

  substrings.select! do |substring|
    (substring.downcase == substring.downcase.reverse) && (substring.size > 1)
  end

  substrings.map! do |palindrome|
    palindrome.length
  end

  if substrings.empty?
    return -1
  else
    substrings.max
  end
end

puts longest_palindrome("supertacocat")
puts longest_palindrome("MomAndDad")
puts longest_palindrome("Palindrome")
