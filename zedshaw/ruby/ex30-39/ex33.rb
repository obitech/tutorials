i = 0
numbers = []

while i < 6
	puts "At the top i is #{i}"
	numbers.push(i)

	i += 1
	puts "Numbers now: ", numbers
	puts "At the bottom i is #{i}"
end

puts "The numbers: "

# 2nd way

 numbers.each {|num| puts num}

def createArray(top)
	array = []
	(0..top).each do |num|
		puts "Top is: #{num}"
		array << num
		puts "Array is: ", array
	end
end	

createArray(8)

def createArray2(top, i_by)
	array = []
	i = 0
	while i <= top 
		puts "Top is: #{i}"
		puts "Incrementing by #{i_by}"
		array << i
		i += i_by
		puts "Array is: ", array
	end
end

createArray2(11, 3)