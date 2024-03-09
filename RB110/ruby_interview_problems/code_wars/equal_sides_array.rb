=begin
You are going to be given an array of integers. Your job is to take that 
array and find an index N where the sum of the integers to the left of N 
is equal to the sum of the integers to the right of N. If there is no 
index that would make this happen, return -1.

EX:
- [1,2,3,4,3,2,1] == (index) 3
- [1,100,50,-51,1,1] == index 1
- [20,10,-80,10,10,15,35] == index 0
