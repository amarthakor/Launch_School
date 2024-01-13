# Your friends just showde up, given the follpowing array of names, use a 'for'
# loop to greet each friend individually.

# friends = ['Sarah', 'John', 'Hannah', 'Dave']

# Expected output:
# Hello, Sarah!
# Hello, John!
# Hello, Hannah!
# Hello, Dave!

friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends
  puts "Hello, #{friend}!"
end

# In for loops, the syntax works where the first variable is something we create
# to represent an individual element within the entire collection, next we use the 
# keyword 'in' to indicate which collections we want, and lastly input the name
# of the collection we are iterating over (array, string, hash, etc.)

# so in this example, 'friend' is the variable we choose to represent an 
# invidividual element within our 'friends' array. we then set the 'for' loop
# by typing 'for friend in friends' to initiate the loop w/ the correct syntax
