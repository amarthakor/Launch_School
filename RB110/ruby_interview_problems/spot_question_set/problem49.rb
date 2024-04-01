=begin
11:15

Some numbers have funny properties. For example:
89 --> 8¹ + 9² = 89 * 1
695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2
46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

Given a positive integer n written as abcd... (a, b, c, d... being digits)
 and a positive integer p
we want to find a positive integer k, if it exists, such as the sum of the 
digits of n taken to the successive powers of p is
equal to k * n.
In other words:
Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k

If it is the case we will return k, if not return -1.

Note: n and p will always be given as strictly positive integers.
dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1
dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k
dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2
dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51


Problem: Given 2 integer arugments, return an integer

Rules:
- GIVEN argument 1
  - find digits of arg1
  - apply 2nd argument as power and incremenet each digit thereafter by +1 power
  - find this sum of digits to power
- RETURN
  - check if the sum above is equal to the 2 arguments multiplied to each other

- (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k
  - if true, return the value of k
  - if not true, return -1

- n is the given number - first argument
- p is the power we start off with - second arugment
- s = sum of the above equation
- k = some number such that s = n * k, if k is real

Algorithm:
- CONVERT arg1 into an array of digits
- ITERATE over array arg1
  - for each digit
    - raise it to the power of arg2
    - incremeent arg2 by += 1
- SUM the above array and set it to max sum
- LOOP over arg1
  - Multiply arg1 by 1 and check if it is equal or less than max_sum
  - if equal or over max sum, break the loop 
  - if less than max sum, increment mulitplayer by 1 and restart
- Check if maxsum is equal to arg1 * multiplyer
  - if true, return multiplyer
  - if false, return -1
=end

def dig_pow(number, power)
  max_sum = number.digits.reverse.map.with_index do |digit, idx|
    digit ** (power + idx)
  end.sum

  multiplyer = 1
  sum = 1
  
  loop do
    sum = number * multiplyer 
    break if sum >= max_sum
    multiplyer += 1
  end

  sum == max_sum ? multiplyer : -1
end


p dig_pow(89, 1) == 1
p dig_pow(92, 1) == -1
p dig_pow(46288, 3) == 51
p dig_pow(695, 2) == 2