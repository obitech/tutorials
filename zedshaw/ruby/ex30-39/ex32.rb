the_count = [1, 2, 3, 4, 5]
fruits = ["apples", "oranges", "pears", "apricots"]
change = [1, "pennies", 2, "dimes", "quarters"]

# traditional style for-loop

for number in the_count
	puts "This is count #{number}"
end

number.each {|i| puts "This is count #{i}"}

# same method, ruby style

fruits.each do |fruit|
	puts "A fruit of type #{fruit}"
end

# same method, another style

change.each {|i| puts "I got #{i}"}

# bulding arrays, start with empty one
elements = []

# then use range operators

(0..5).each do |i|
	puts "adding #{i} to the list."
	elements.push(i)
end

# no we can print them out
elements.each {|i| puts "Element was: #{i}"}	