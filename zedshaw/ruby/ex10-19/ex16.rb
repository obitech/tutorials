filename = ARGV.first #opening file with one argument

puts "We're going to erase #{filename}"
puts "If you don't want that, hit CTRL-C (^C)."
puts "If you want that, hit RETURN."

$stdin.gets #waiting for input

puts "Opening the file..."
target = open(filename, 'w') #opening file, 'w'riting a new one

puts "Truncating the file. Goodbye!"
target.truncate(0) #erasing 

puts "Now I'm going to ask you for three lines."

# getting three lines, strings into vars
print "line 1: "
line1 = $stdin.gets.chomp
print "line 2: "
line2 = $stdin.gets.chomp
print "line 3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these to the file."

#writing in target file
string = line1 + "\n" + line2 + "\n" + line3 + "\n"
target.write(string)

#old code
# target.write(line1)
# target.write("\n")
# target.write(line2)
# target.write("\n")
# target.write(line3)
# target.write("\n")

puts "And finally, we close it."
target.close

puts "Do you want to read your #{filename}? y/n"
q = $stdin.gets.chomp.downcase

if q == "y"
	txt = open(filename)
	print txt.read
else
	puts "Thanks!"
end		