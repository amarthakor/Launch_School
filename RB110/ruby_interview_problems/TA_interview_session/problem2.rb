=begin# 
# Write a function that masks proper nouns and numbers in a sentence. 
Use * to mask proper nouns and use # to mask numbers. You may assume that a 
sentence will not begin with a proper noun and will not end with a number 
or proper noun. Numbers can only be integers.

# # Test cases
# puts mask_sentence("They bought 5 apples from John yesterday.")  
# They bought # apples from **** yesterday.
# puts mask_sentence("Alice and Bob went to Paris in 2021 to have a vacation.") 
# Alice and *** went to ***** in #### to have a vacation.

# puts mask_sentence("They bought 5 apples from John yesterday.")
# puts mask_sentence("Alice and Bob went to Paris in 2021 to have a vacation.")


=end