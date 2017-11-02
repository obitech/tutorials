BEGIN { puts "Beginning" }	

### alias ###

def compute(x, y)
	z = (x + y) * 2
	puts "Computing #{x} + #{y} times 2, the answer is: #{z}"
end
compute(2, 3)

alias addition compute
addition(2, 3)

compute(2, 3)

### break ###

for i in 0..4
	if i > 3
		break
	end	
	puts "local var: #{i}"
end

### case ### 

age = 5
case age
	when 0..4
		puts "Baby"
	when 5..10
	 	puts "Child"
	when 11..20
		puts "Adolescent"
	else 
		puts "pretty old"	 	
end

### begin, end, ensure ###



END { puts "End" }
