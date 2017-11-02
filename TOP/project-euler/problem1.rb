puts """
ProjectEuler.net - Problem 1\n
If we list all natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all multiples of 3 or 5 below X.\n
"""

print "Please enter an integer for X: "
x = gets.chomp.to_i

def sum_of_mult(n)
	total = 0
	for i in 1...n
		if (i % 3 == 0) || (i % 5 == 0)
			total += i
		end	
	end	
	total
end	

puts "\nThe sum of all multiple of 3 or 5 below #{x} is #{sum_of_mult(x)}."