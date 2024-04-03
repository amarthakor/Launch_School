=begin
A child is playing with a ball on the nth floor of a tall building. 
The height of this floor, h, is known.
He drops the ball out of the window. The ball bounces (for example), 
to two-thirds of its height (a bounce of 0.66).
His mother looks out of a window 1.5 meters from the ground.
How many times will the mother see the ball pass in front of her 
window (including when it's falling and bouncing?

Three conditions must be met for a valid experiment:
Float parameter "h" in meters must be greater than 0
Float parameter "bounce" must be greater than 0 and less than 1
Float parameter "window" must be less than h.
If all three conditions above are fulfilled, return a positive integer,
otherwise return -1.

Note:
The ball can only be seen if the height of the rebounding ball 
is strictly greater than the window parameter.

Example:
- h = 3, bounce = 0.66, window = 1.5, result is 3
  - Goal : to count how many times the ball goes down and up to 1.5 meters
    - Ball drops from 3meters, pass : 1
    - Ball bounces 3 * .66 = 2meters, pass : 2
    - ball drops from 2m to floor, pass 3:
    - ball bounces 2m * .66 = 1.3m, ball fails to hit 1.5meters
    - Every time the ball bounces to at least W height, add 2 to passes
    - As soon as ball fails to hit at least W height, stop counting

- h = 3, bounce = 1, window = 1.5, result is -1

Problem: Given three integers, return a new integer

Rules:
- Return -1 if the conditions cannot be met
- Argument format (H, B, W)
  - Conditions:
    - H > 0
    - 1 > B > 0
    - H > W

- Ball drops out of a window at a given height, h. The ball hits the ground and
  - bounces, b, to some height. Mother looks out the window at a given height, W,
  - How many times will the mother see the ball pass in front of her window?
  - Include when the ball is falling and bouncing

  Algorithm:
- RETURN -1 if any of the conditions listed above are not met
- Set bounces to 1
- SET new_height to h * b
- LOOP over the arguments provided
  - If new_height value is less than W, break out of the loop
  - OTHERWISE increment bounces by 2 
  - REASSIGN new_height to the current value of new_height * b and reloop
- RETURN bounces
=end

def bouncingBall(h, b, w)
  return -1 if h <= w || h <= 0 || b >= 1 || b <= 0
  bounces, new_height = 1, h * b

  loop do
    break if new_height <= w
    bounces += 2
    new_height *= b
  end

  bounces
end

p bouncingBall(3, 0.66, 1.5) == 3
p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3
p bouncingBall(40, 1, 10) == -1
p bouncingBall(-5, 0.66, 1.5) == -1
p bouncingBall(1, 0.66, 0.66) == 1
p bouncingBall(1, 0.66, 1) == -1
