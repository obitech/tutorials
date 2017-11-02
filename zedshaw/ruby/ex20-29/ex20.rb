# loads one file into variable
input_file = ARGV.first

# prints out the file
def print_all(f)
	puts f.read
end

# jumps back to first position of file
def rewind(f)
	f.seek(0)	
end

# prints out the number of the line and what's written
def print_a_line(line_count, f)
	puts "#{line_count}, #{f.gets.chomp}"
end

# loads input_file into variable
current_file = open(input_file)	

# calls print_all func
puts "First let's print the whole file:\n"
print_all(current_file)

# rewinds back to beginning
puts "Now let's rewind, kind of like a tape."
rewind(current_file)

puts "Let's print three lines:"

current_line = 1
print_a_line(current_line, current_file)

current_line += 1
print_a_line(current_line, current_file)
 
current_line += 1
print_a_line(current_line, current_file)