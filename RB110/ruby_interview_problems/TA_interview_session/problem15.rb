# Implement the function/method, minimum shorten. The function shortens a sentence such that it will fit within the character limit set. It shortens by removing vowels in the sequence of a, e, i, o, and u. Start removing from the end of the sentence. If it can not be shortened to fit within character limit, return an empty string. Spaces don’t count for the limit.  -- Edward

# puts minimum_shorten("This is a test sentence", 18) # This is  test sentence
# puts minimum_shorten("Hello World", 8) # Hllo Wrld
# puts minimum_shorten("Short", 10) # Short
# puts minimum_shorten("A very long sentence with many vowels", 10) # ""