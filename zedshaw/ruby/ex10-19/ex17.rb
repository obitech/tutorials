# opens origin and destination file 
from_file, to_file = ARGV

# load data from origin file into variable
indata = open(from_file).read

puts "Copying #{from_file} (#{indata.length} bytes) to #{to_file}. Does the output file exist? #{File.exist?(to_file)}"

# loading up destination file with write
out_file = open(to_file, 'w')
out_file.write(indata) #writing from previous variable

puts "File copied."

out_file.close

