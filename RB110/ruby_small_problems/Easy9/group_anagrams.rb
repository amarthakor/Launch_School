=begin
given an array
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

Write a program that prints out groups of words that are anagrams. Anagrams are 
words that have the same exact letters in them but in a different order. 
Your output should look something like this:

["demo", "dome", "mode"]
["neon", "none"]
#(etc)

--- P
- given: array of unfiltered words
- return: arrays of filtered words
        - filter the words that are anagrams
        - anagrams are words that contain the same letters but different arrangement
        - output should group all anagrams in their own array
        - so i'll be returning multiple arrays dependent on different anagrams
        - what happens if array is empty?
          - return empty array
        - what happens if different object is passed as argument?
          - only array obj will be passed
        - within subarrays, words are sorted alphabetically

--- E
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

- words that are anagrams
  = [demo, dome, mode]
  = ['neon', 'none']
  = [live, veil, vile]
  ...

--- D
beginning: array
middle: group like words into subarrays and sort them alphabetically
end: multiple arrays or subarrays?

--- A
- RETURN [] if given array is empty
- CREATE a results array
- ITERATE over each element in given array
  - CREATE an empty array to hold similar anagrams
    - FOR EACH element,
      - SORT the chars alphabetically and join them back into one word
      - If this sorted word is the same as the current element sorted alpphabetically,
        - append it into similar_anagrams
      - otherwise, move onto the next iteration
    - APPEND the current similar_anagrams array into the results array
- REMOVE all duplicate subarrays
- SORT each subarray alphabetically
- PRINT each subarray to the console

=end

def anagrams(words)
  return [] if words.empty?
  results = []

  words.size.times do |start_idx|
    similar_anagrams = []
    0.upto(words.size - 1) do |end_idx|
      if words[start_idx].chars.sort.join == words[end_idx].chars.sort.join
        similar_anagrams << words[end_idx]
      end
    end
    results << similar_anagrams
  end

  results.uniq.each { |subarr| p subarr }
end


words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

anagrams(words)