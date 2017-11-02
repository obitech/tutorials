print "Give me a number: "
number = gets.chomp.to_i

bigger = number * 100
puts "A bigger number is #{bigger}"

print "Give me another number: "
another = gets.chomp
number = another.to_f

smaller = number / 100
puts "A smaller number is #{smaller}"


print "How much money do you give me? "
money = gets.chomp.to_f
pay_out = money * 0.1
puts "Here's $#{pay_out} back"