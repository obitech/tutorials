puts						put a string on screen
= 							operator, assings value
#{}							String interpolation
# 							comment
*							operator, multiply
true / false				boolean data type
print						print on screen, no line break
%							Modulus, divides left by right and returns remainder
							comparison, OR
							Hash map?
\n 							line break in string
""" 						multi line string
gets.chomp					gets a line of text minus the line break
.to_i						transforms to integer
.to_f						transforms to floating point
ARGV						assigns argument passed by command line
ARGV.first					needed when only one argument is passed
$stdin.gets.chomp			needed when ARGV is used
puts <..>, <..>				functions as second puts
open(x, y)					invokes File method open with two arguments:
							x -> filename
							y -> read/write mode ("r", "w")
foo.read 					grabs contets of file							
foo.close					closes file !!
foo.truncate(x)				truncates (cuts down) to x byte of file
foo.write(x)				writes x to file
File.exist?(x)				checks if x exists
def() .. end				function
foo.seek(x)					rewinds file to x byte