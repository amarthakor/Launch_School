=begin
Input
The input consists of a single non-empty string, consisting only of uppercase
English letters, the string's length doesn't exceed 200 characters

Output
Return the words of the initial song that Polycarpus used to make a dubsteb 
remix. Separate the words with a space.


Examples
song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") => WE ARE THE
CHAMPIONS MY FRIEND

Problem: Given a string, modify and return the string / new string

Rules:
1) All occurrences of 'WUB' should be removed/replaced/deleted etc.
2) Words that remain must be separated by a space
3) Make sure case is kept uppercased


Algorithm:
- CONVERT the string into an of elements, where the separator is 'WUB'
- REMOVE all elements that are empty strings
- JOIN the array back into and separte the words with a space

=end

def song_decoder(string)
  (string.split('WUB') - ['']).join(' ')
end


p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"