=begin
The Hamming distance is only defined for sequences of equal length.
If you have two sequences of unequal length, you should compute the
Hamming distance over the shorter length.

Need to find the differences between two genomic codes
If genomic codes are different lengths, should find the Hamming
distance from the shroter length genome

--- P
Problem : Given two strings, find the difference in the strings

Rules:
- If different length genomes, select over shorter genome
- Need to count the difference between two genomes

--- E
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
- 7 different nucleotide pairs, over same length genome

---- D
- probably use array to split genome into single pairs and then
iterate over array of genomic chars

---- A
- CREATE instance of DNA with one argument, current genome string
- CREATE helper method 'hamming_distnace()'
  - takes one argument
  - returns the integer difference between first genome and argument.
=end

# class for DNA instance objects
class DNA
  def initialize(genome_strand)
    @genome = genome_strand
  end

  def hamming_distance(strand)
    distance = 0
    shorter_strand = @genome.size > strand.size ? strand : @genome

    shorter_strand.chars.each_index do |idx|
      distance += 1 if @genome[idx] != strand[idx]
    end

    distance
  end
end

# 'GAGCCTACTAACGGGAT'
strand = 'CATCGTAATGACGGCCT'

dna = DNA.new('GAGCCTACTAACGGGAT')
p dna.hamming_distance(strand)
p dna
