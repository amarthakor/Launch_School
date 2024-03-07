=begin
- given: string that represents an integer value
- return: number of total odd-numbered substrings that can be formed
        - all possible substrings starting from 0..-1

- E
- '1341' = 7
  - 1341
    - 1     1
    - 13    2
    - 131   3
    - 3     4
    - 341   5
    - 41    6
    - 1     7
- duplicates count
- at some point convert str to integer

- D
- string
- array to hold all substrings
- integer

- A
- CREATE array of all substrings
- TRANSFORM substrings to integers
- SELECT all odd integers
- RETURN the size of all odd integer array
=end

def odd_nums(str)
  substrings = []
  str.size.times do |start_idx|
    start_idx.upto(str.size - 1) do |end_idx|
      substrings << str[start_idx..end_idx]
    end
  end

  substrings.map! { |string| string.to_i }
  substrings.select { |num| num.odd? }.count
end

p odd_nums('1341') == 7
p odd_nums("1357")  == 10
p odd_nums("13471")  == 12
p odd_nums("134721")  == 13
p odd_nums("1347231")  == 20
p odd_nums("13472315")  == 28