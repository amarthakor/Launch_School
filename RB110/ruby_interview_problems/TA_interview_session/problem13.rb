=begin

Write a program that reads the content of a text file and then prints the longest 
sentence in the file based on number of words. Sentences may end with periods (.),
exclamation points (!), or question marks (?). Any sequence of characters that are
not spaces or sentence-ending characters should be treated as a word. You should
also print the number of words in the longest sentence.

sentences = text.split(/\.|\?|!/)

Problem: Given a string, return a string (and integer?)

Rules:
- Given a long text file
  - Parse thru text file
  - Return sentence from text file that is the longest (most words)
  - Also print the number of words in the longest sentence

- Sentences may end with ., !, or ?
- Any chars that are not spaces or sentence finishers should be counted as words


Algorithm:
- CONVERT the text file into an array of sentences
- SET some variable to max_sentence_length
  - ITERATE over array
    - for each sentence
      - transform to sentence size
  - SELECt largest value from transformed string

- ITERATE through the array
  - for each sentence
    - SELECT the sentence that has the same count as the max value variable
    - convert to string
    - save to some var

- RETURN longest_sentence and max_senence_size
=end

def max_sentence_finder(text)
  text.gsub!("\n", ' ')
  text = text.split(/\.|\?|!/)

  max_length = text.map { |sentence| sentence.size }.max
  longest_sentence = text.select {|sentence| sentence.size == max_length }.join
  
  puts longest_sentence
  puts "#{longest_sentence.split.size} words in sentence"
end

p max_sentence_finder("Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.")
