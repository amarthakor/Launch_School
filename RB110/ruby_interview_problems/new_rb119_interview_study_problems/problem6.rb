=begin
Create a method that takes a string argument and returns a hash in 
which the keys represent the letters in the string, and the values 
represent how often the corresponding letter occurs in the string.

expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
p count_letters('woebegone') == expected

expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
            'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
p count_letters('lowercase/uppercase') == expected

expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
p count_letters('W. E. B. Du Bois') == expected

p count_letters('x') == {'x' => 1}
p count_letters('') == {}
p count_letters('!!!') == {}
6:21

Problem:
- Given a string argument, return a hash where the keys represent
  letters from the string, and the values represent the count of said letters

Rules:
- keys are all unique letters
- do not count uppercase letters
- do not count special chars
- only count lowercase alphabetical chars
- return empty hash if string is empty
- return empty hash if string has no lowercase alphabtical chars

Examples:
- 'W E B Du Bois' -> 'u':1, 'o':1, 'i':1, 's':1

Algorithm:
- RETURN empty hash if string is empty or does not contain any lowercaes alphas
- CREATE an empty results hash
- CREATE an array of all unique chars
- CREATE a string of lowercase alphachars
- ITERATE over the string of unique chars
  - for each char
  - if the furrent letter is lowecase alpha
    - create a KV pair of the letter -> count
- RETURN the hash

=end
LOWERCASE_ALPHA = ('a'..'z').to_a.join

def count_letters(string)
  return {} if string.empty?
  letters = {}
  uniq_chars = string.chars.uniq
  lowercase_alpha = ('a'..'z').to_a.join

  uniq_chars.each do |letter|
    letters[letter] = string.count(letter) if LOWERCASE_ALPHA.include?(letter)
  end

  letters
end

expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
p count_letters('woebegone') == expected

expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
            'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
p count_letters('lowercase/uppercase') == expected

expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
p count_letters('W. E. B. Du Bois') == expected

p count_letters('x') == {'x' => 1}
p count_letters('') == {}
p count_letters('!!!') == {}