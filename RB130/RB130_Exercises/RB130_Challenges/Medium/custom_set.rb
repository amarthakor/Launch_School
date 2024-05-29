# Create a custom set type.

# Sometimes it is necessary to define a custom data structure of some type,
#  like
# a set. In this exercise you will define your own set type. How it works
#  internally
# doesn't matter, as long as it behaves like a set of unique elements that
#  can be
# manipulated in several well defined ways.

# For simplicity, you may assume that all elements of a set must be
# numbers.

=begin
80:01pm

---- P
Problem: Create a set of unique elements that can be manipulaed in defined
  ways

Rules:
- All elements of a set must be numbers
  - Does this mean other sets can be different data types?
  - Numbers are integers or floats also?

Methods Required
- Constructor method that takes array of integer(s)
- Instance method #empty, checks if array is empty
- Instance method #contains?(), takes argument and returns true if
    set contains argument
- Instance method #subset?()
  - Seems as if the calling object must be contained in the argument
    and return true
    - otherwise returns false?
- #instance method #disjoint()
  - MAYBE return true if calling object and arg dont have same sets?
  - otherwise return false
  - not sure if this is correct
- instance method #eql
  - Return true if sets have same unique value
- instance method #add()
  - adds argument to set
- instance #intersection()
  - returns an object with a set of all shared elements
- instance #differnece()
  - returns an object with a set of all elements from the calling object
     that are not in the argument object
- instnace #union()
  - returns an object with a set of all unique elements from calling set
    + argument set

=end

class CustomSet
  attr_reader :set

  def initialize(*elements)
    @set = elements.flatten
  end

  def empty?
    set.empty?
  end

  def contains?(element)
    set.include?(element)
  end

  def subset?(other)
    set.all? { |ele| other.set.include?(ele) }
  end

  def disjoint?(other)
    set.map { |ele| other.set.include?(ele) }.all?(false)
  end

  def eql?(other)
    set.uniq.sort == other.set.uniq.sort
  end

  def add(element)
    set << element if !set.include?(element)
    CustomSet.new(set)
  end

  def intersection(other)
    shared_elements = set.select { |ele| other.set.include?(ele) }
    CustomSet.new(shared_elements)
  end

  def difference(other)
    unshared_elements = set.select { |ele| !other.set.include?(ele) }
    CustomSet.new(unshared_elements)
  end

  def union(other)
    combined_elements = (set + other.set).uniq.sort
    CustomSet.new(combined_elements)
  end

  def ==(other)
    set == other.set
  end
end

# test = CustomSet.new(1, 2)
# test1 = CustomSet.new(2, 3)
# p test.intersection(test1)
