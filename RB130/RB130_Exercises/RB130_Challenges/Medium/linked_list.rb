# Write a simple linked list implementation. The linked list is a fundamental
# data structure in computer science, often used in the implementation of
# other data structures.

# The simplest kind of linked list is a singly linked list. Each element
# in the list contains data and a "next" field pointing to the next element
# in the list of elements. This variant of linked lists is often used to
# represent sequences or push-down stacks (also called a LIFO stack;
# Last In, First Out).

# Let's create a singly linked list whose elements may contain a range of
# data such as the numbers 1-10. Provide methods to reverse the linked list
# and convert a linked list to and from an array.

# 5:16pm 5:32pm

=begin
---- P

Problem: Create a linked list, where elements may contian a range of data

Rules:
- Methods to reverse the linked lest
- Method to convert list to an array
- Method to convert list from an array
- Last in, first out
  - what does this mean?

- NEED TWO CLASSES
  - Element class and SimpleLinkedList class
  - Element class methods
    - Constructor method that accepts multiple arguments?
    - Instance #datum method
    - Instance #tail method
  - SimpleLinekdList class methods
    - Constructor method takes no arguments
      - Instance method #push that takes one argument and adds it to the list
      - Instance method #size take returns integer of elements in list
      - Instance method #empty? that returns true if list is empty
      - Instance method #peek - not sure what this does
        - perhaps returns the last element/most recent added element in list?
      - Instance method #head, returns last element frmo the list.