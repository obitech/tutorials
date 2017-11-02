filename = ARGV.first # getting filename by terminal

txt = open(filename) # opening file in txt variable

puts "Here's your file #{filename}:"
print txt.read # calling .read on txt, giving filename

print "Type the filename again: "
file_again = $stdin.gets.chomp # repeating the same script just with user input from inside

txt_again = open(file_again)

print txt_again.read

txt_again.close