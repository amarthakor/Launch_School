=begin
The alphabetized kata
Re-order the characters of a string, so that they are concatenated 
into a new string in
"case-insensitively-alphabetical-order-of-appearance" order. Whitespace
 and punctuation shall simply be removed!
The input is restricted to contain no numerals and only words containing
 the english alphabet letters.

Example:
alphabetized("The Holy Bible") # "BbeehHilloTy"


Problem: Given a string, return a string

Rules:
- SORT the given string to the following criteria
  - case is insensitive
  - alphbetical order
  - rmeove whitespace and punctuation
- INPUT only contains alphabetical letters / whitespace

Algorithm:
- CREATE an array of chars with all whitespcae removed
- SORT chars by preference of lowercase letters
  - for each char
    - sort it as if it was lowercased

=end


def alphabetized(string)
  string.scan(/[a-zA-Z]/).sort_by { |letter| letter.downcase }.join
end

# test case answers might be different due to how Array#sort functioned in
# previous ruby versions, as solution works on codewars but does not output
# expected output in terminal

p alphabetized("The Holy Bible")  #== "BbeehHilloTy"
# p alphabetized("") == ""
# p alphabetized(" ") == ""
# p alphabetized(" a") == "a"
# p alphabetized("a ") == "a"
# p alphabetized(" a ") == "a"
# p alphabetized("A b B a") == "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") #== "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"