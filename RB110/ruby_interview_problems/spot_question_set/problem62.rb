=begin
You probably know the "like" system from Facebook and other pages. 
People can "like" blog posts, pictures or other
items. We want to create the text that should be displayed next to such an item.
Implement a function likes :: [String] -> String, which must take in 
input array, containing the names of people who like
an item. It must return the display text as shown in the examples:

likes [] // must be "no one likes this"
likes ["Peter"] // must be "Peter likes this"
likes ["Jacob", "Alex"] // must be "Jacob and Alex like this"
likes ["Max", "John", "Mark"] // must be "Max, John and Mark like this"
likes ["Alex", "Jacob", "Mark", "Max"] // must be "Alex, Jacob and 2 others like this"


Problem: Given an array, return a string

Rules:
- Given array contains the names of people who have 'liked' a page
- Return string should show the names of the people who liekd page BASED ON THE FOLLOWING:
  - IF no one has liked page, 'no one likes this'
  - IF 3 people or less liked page, 'person 1, person and eprson3 like this'
  - IF more than 3 people liked page, MOST recent 2 people liked page and number left liked page
      - if 4 people like this page -> 'person1, person2 and 2 others like this'
        [alex, jacob, mark, max]   -> 'Alex, Jacob and 2 others like this'


Algorithm:
- return 'no one likes this' if given array is empty
- IF array size is 1
  - 'jacon' likes this'
- Elsif array size is 2
  - 'tim and matt like this'
- Elsif array size is 3
  - 'tim, matt and kevdog like this'
- Else
  - 'array[0], array1 and array.size-2 others like this'

=end

def likes(likers)
  return 'no one likes this' if likers.empty?

  if likers.size == 1
    "#{likers.first} likes this"
  elsif likers.size == 2
    "#{likers.first} and #{likers[1]} like this"
  elsif likers.size == 3
    "#{likers.first}, #{likers[1]} and #{likers[2]} like this"
  else
    "#{likers.first}, #{likers[1]} and #{likers.size - 2} others like this"
  end
end



p likes([])                                ==  "no one likes this"
p likes(["Peter"])                         ==  "Peter likes this"
p likes(["Jacob", "Alex"])                 ==  "Jacob and Alex like this"
p likes(["Max", "John", "Mark"])           ==  "Max, John and Mark like this"
p likes(["Alex", "Jacob", "Mark", "Max"])  ==  "Alex, Jacob and 2 others like this"