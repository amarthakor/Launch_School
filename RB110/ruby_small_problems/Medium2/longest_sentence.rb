=begin
Write a program that reads the content of a text file and then prints the 
longest sentence in the file based on number of words. Sentences may end 
with periods (.), exclamation points (!), or question marks (?). Any 
sequence of characters that are not spaces or sentence-ending characters 
should be treated as a word. You should also print the number of words in 
the longest sentence.

Example text:
Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
tha....

--- P
-given: a long text file
- return: prints the longest setence in the text file and its word count in integers
          - sentences can end with '?', '!', or '.'
          - words are anything that are not spaces separating collection of chars
          - also count the number of words and print its size with the sentence

- assume text file wont be empty
- assume only string objects passed in

--- E
- in speech below, longest sentence is 86 words long
  - contains special chars, ends in '.'

--- D
begnning: string
middle: array to separate words by specific criteria
end: string + integer

--- A
- SPLIT the text into array separated by punctuation (? ! .)
- COUNT the size of each sentence element
- SELECT the sentence w/ the most words
  - set a sentence_word_count to ''
  - for the first sentence, set the count to the words in the 1st sentence
  - if the next setence has more words, set the sentence count to the new string
  - otherwise moveonto the next string
- RETURN the setence and its size

=end
DELIMITERS = ['! ', '. ', '? ']

def longest_sentence(story)
  longest_sent = ''
  longest_size = 0
  story.gsub!("\n", ' ')
  split_story = story.split(Regexp.union(DELIMITERS))

  split_story.map { |sentence| longest_size = sentence.split.size }.max
  split_story.each_with_index do |sentence, idx|
    longest_sent = sentence if idx == 0
    longest_sent.size < sentence.size if longest_sent = sentence
  end
  puts longest_sent
  longest_size
end

speech = "Four score and seven years ago our fathers brought forth
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
earth."

p longest_sentence(speech)