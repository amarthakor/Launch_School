=begin
triple_double(num1, num2)

which takes numbers num1 and num2 and returns 1 if there is a 
straight triple of a number at any place in num1 and
also a straight double of the same number in num2.
If this isn't the case, return 0


Examples
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and num2 has straight double 99s
triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2

Problem: Given two integers, return an itneger

Rules:
- Return 1 if
  - there is a straight triple of a num in num1 AND a double of the same number in
  - num 2
- Otherwise, return 0

Algorithm:
- CREATE an array of triples
- CREATE an array of doubles
- CREATE a comparison array
- ITERATE over the array of tripples
  - Check if a string verison of the current num is found in string num1
  - if so, move to an tripples
- ITEATE over array of doubles
  - check if a string version of the current num is found in string num2
  - if so, move to the dpib;es array
- ITERATE over tripples array
  - for each tripple
    - ITERATE over doubles array
      - for each double
        - if the current double is equal to the first 2 digits of the tripple
          - return 1
- RETURN 0
=end

TRIPLES = ['000', '111', '222', '333', '444', '555', '666', '777', '888', '999']
DOUBLES = ['00', '11', '22', '33', '44', '55', '66', '77', '88', '99']

def triple_double(num1, num2)
  triples, doubles = [], []
  TRIPLES.each { |num| triples << num if num1.to_s.include?(num) }
  DOUBLES.each { |num| doubles << num if num2.to_s.include?(num) }

  return 0 if triples.empty? || doubles.empty?

  triples.each do |triple|
    doubles.each { |double| return 1 if double == triple[0..1] }
  end

  0
end


p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(451999277, 41177722899) == 1
p triple_double(10560002, 100) == 1
p triple_double(629993266618090447, 4399774932905889598) == 1