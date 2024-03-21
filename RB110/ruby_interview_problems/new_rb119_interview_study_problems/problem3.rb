=begin
Create a method that takes a string argument and returns a copy of 
the string with every second character in every third word converted
to uppercase. Other characters should remain the same.

Examples:
original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
p to_weird_case(original) == expected

original = 'It is a long established fact that a reader will be distracted'
expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case(original) == expected

p to_weird_case('aaA bB c') == 'aaA bB c'

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
p to_weird_case(original) == expected

Problem:
- Return the given string with every second character in every 3rd word uppercased
- All other chars should remain the same
- Is a copy of the string a new string or the same given string?

Input: string
Output: modified string

Example:
original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
- Every third word -> favorite, supercalifragi...
  - every 2nd Char -> fAvOrItE, sUpErCaLiFrAgI...
  -> "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"

Data Structures:
- Array would allow to easily modify each word and convert from string to array
  and array to string

Algorithm:
- SPLIT the string into an array of words
- ITERATE over the words
  - for every third word, iterate over that word
    - every second character should be upcased
- JOIN the array back into a string, where words are separated by spaces

=end

def to_weird_case(string)
  string.split.map.with_index do |word, idx|
    if (idx + 1) % 3 == 0
      word.chars.map.with_index do |char, idx| 
        (idx + 1) % 2 == 0 ? char.upcase : char
      end.join
    else
      word
    end
  end.join(' ')
end

original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
p to_weird_case(original) == expected

original = 'It is a long established fact that a reader will be distracted'
expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case(original) == expected

p to_weird_case('aaA bB c') == 'aaA bB c'

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
p to_weird_case(original) == expected