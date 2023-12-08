# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

def get_bill
  puts "What is the bill?"
  bill = gets.chomp.to_f
end

def get_tip
  puts "What is the tip percentage?"
  tip = gets.chomp.to_f / 100
end

def calc_tip(bill, tip)
  bill * tip
end

def calc_total(bill, tip)
  bill + tip
end

def display_total(bill, tip)
  puts "Your tip is $#{tip}"
  puts "Your total is $#{bill}"
end

bill = get_bill
tip = get_tip

tip_amount = calc_tip(bill, tip).round(2)
total = calc_total(bill, tip_amount).round(2)

display_total(total, tip_amount)
