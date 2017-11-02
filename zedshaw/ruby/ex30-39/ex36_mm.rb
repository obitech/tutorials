module	CodeBreaker

	def help
		puts "MasterMindBreaker 3.0 by Cl34rF!x. Hack the planet!"
		puts "Parse any doorkeypad with our simple and effective algorithm, here is how it works:"
		puts "1) The doorcode gets hashed into a hidden, three digit codehash (from 0 to 5)"
		puts "2) Numbers in the codehash are unique and not repeated throughout the hash"
		puts "3) Enter your guess of the codehash"
		puts "4) Check your guess against the checksymbols:"
		puts "\t! -> One entered number is in the hash and in the right position."
		puts "\t? -> One entered number is in the has but not in the right position."
		puts "\tX -> One entered number is not in the hash."
		puts "The positions of the symbols are not related to the positions of the entered numbers."		
		puts "For example:"
		puts "The hidden codehash is [1, 2, 3]"
		puts "You first enter: 2 4 3"
		puts "And the symbols would be: [!, ?, X]"
		puts "Continue?"
		$stdin.gets
		code_start
	end

	def code_start
		while true
			puts "\nMasterMindBreaker 3.0 loaded successfully."
			puts "Enter -help for help."
			puts "Enter -hack to start."
			puts "Enter -exit to terminate process."
			input = $stdin.gets.chomp

			if input == "-help"
				help

			elsif input == "-hack"
				code_run($code)

			elsif input == "-exit"
				security_room

			else	
				puts "Invalid command."
			end	
		end
	end

	def create_code
		# This creates an array with 3 unique numbers from 0 to 5
		$code = []
		while $code.length < 3 do 
			random = rand(6)
			unless $code.include?(random)
				$code << random
			end
		end
	end

	def code_run(code)

	puts "#{code}"
	
	puts "Please enter three integers from 0 to 5 in the following format: 1 2 3"
	check = []
	attempts = 1
	until check == ["!", "!", "!"]
		# Creating an array to with an user input
		print "Attempt ##{attempts} > "
		input = $stdin.gets

		enter = input.split(" ")
		enter.map! { |i| i.to_i }
	
		# Check enter against code 3 times
		# 1) if enter at position equals code at position -> push ! into check[]
		# 2) if enter at poisition is found in code but not at same poisition -> push ? into check[]
		# 3) if enter at poisition is not found in code at all -> push 0 into check[]
	
		for i in 0..2
			if enter[i] == code[i]
				check << "!"
			elsif code.include?(enter[i]) && (enter[i] != code[i])
				check << "?"
			else
				check << "X"						
			end
		end	
			
		check.sort!
		print "#{enter} --> #{check}\n"

		attempts += 1

		# Breaking out of the loop
		unless check == ["!", "!", "!"]
	 		check = []
		 end 

		 puts "Code successfully cracked (#{code}). Continue?"
		 $stdin.gets		 
		 security_room
	end	
		
	end

end	