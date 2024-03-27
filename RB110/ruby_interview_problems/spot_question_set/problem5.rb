=begin
Longest vowel chain
The vowel substrings in the word codewarriors are o,e,a,io. The longest 
of these has a length of 2. Given a lowercase string that has alphabetic 
characters only and no spaces, return the length of the longest vowel substring. 

Vowels are any of aeiou.


Problem: Given a strng, return an itnger

Rules:
- Integer represents the longest substring of vowels
- VOWELS are aeiou
- strings will be in all lowercase
- return the longest vowel substring

Algorithm: 
- REPLACE any nonvowels with a space
- CONVERT the new string of only spaces and vowels into an array
- TRANSOFRM the array of vowels into integers represented by their length
- SELECT the longest length

=end

# without regex

# def solve(string)
#   string.chars.map do |letter|
#     'bcdfghjklmnpqrstvwxyz'.include?(letter) ? ' ' : letter
#   end.join.split.map { |word| word.length }.max
# end

# with regex
def solve(string)
  string = string.gsub!(/['bcdfghjklmnpqrstvwxyz']/, ' ').split
    string.map { |word| word.length }.max
end
p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8