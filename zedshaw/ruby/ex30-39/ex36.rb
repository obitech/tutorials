load "ex36_mm.rb"
include CodeBreaker

$inv = []
$armory_door = 0
$exit_door = 0

def no_interest
	puts "There is nothing left of interest here."
end

def security_terminal
	puts "Reyon DefSci Inc. - Security Systems"
	puts "Logged in as: level02sec"
	puts "Available commands:"
	puts "-status"
	puts "-email"
	puts "-cctv"
	puts "-door_status"
	puts "-help"
	puts "-exit"
	puts "Please enter command:"

	while true
		print ">"
		input = $stdin.gets.chomp.downcase

		if input == "-status"
			puts "Facility status: LOCKDOWN"
			puts "Threat level: RED"
			puts "Permissions: LIMITED"

		elsif input == "-email"
			puts " -- SYSTEM NOTICE -- "
			puts "Due to a security breach the whole facility has been locked down. Threat level has increased to RED."
			puts "Please find your way to Level 01 immediately."
			puts " -- SYSTEM NOTICE -- "	

		elsif input ==  "-cctv"
			puts "ERROR: CCTV feed unavailable."

		elsif input == "-door_status"
			puts "Door status:"
			puts "holding_cell: UNLOCKED"

			if $armory_door == 0
				puts "armory: LOCKED"
			else 
				puts "armory: UNLOCKED"
			end	

			puts "security: UNLOCKED"
			
			if $exit_door == 0
				puts "exit: LOCKED"
			else
				puts "exit: UNLOCKED"	
			end
			puts "use commands to change status (lock/unlock)."			

		elsif input == "unlock exit"
			puts "Door status - exit: UNLOCKED"
			$exit_door = 1

		elsif input == "lock exit"
			puts "Door status - exit: LOCKED"
			$exit_door = 0

		elsif input == "unlock armory"
			puts "Door status - armory: UNLOCKED"
			$armory_door = 1

		elsif input == "lock armory"
			puts "Door status - armory: LOCKED"
			$armory_door = 0
					
		elsif input == "lock holding_cell"
			puts "ERROR: can't change door status. Please contact system administrator."

		elsif input == "lock security"
			puts "ERROR: can't change door status. Please contact system administrator."
		
		elsif input == "-help"
			security_terminal

		elsif input == "-exit"
			security_room

		else
			puts "Command not recognized."
		end	


	end
end

def security_room
	password = []
	create_code
	puts "#{$code}"

	puts "You find yourself in a small windowless room with a big computer terminal in it."
	puts "Out of all the screen only one is lit and it prompts a password."
	puts "Next to to the keyboard you can see laptop plugged into the terminal with some kind of software running."
	puts "What do you do?"

	while true
		print ">"
		choice = $stdin.gets.chomp.downcase

		if choice == "show inventory"
			puts "Your inventory includes: #{$inv}"

		elsif choice == "look around"
			puts "Out of all the screen only one is lit and it prompts a password."
			puts "Next to to the keyboard you can see laptop plugged into the terminal with some kind of software running."
			
		elsif choice == "use terminal"
			print "Please enter the password: "
			input = $stdin.gets.chomp
			password = input.split(" ")
			password.map! { |x| x.to_i }
			if password == $code
				puts "Password accepted."
				security_terminal
			else 
				puts "Password denied."
			end

		elsif choice == "use laptop"
			code_start
			
		else	
			puts "I don't know what that means"
		end		
	end
end

def corridor
	puts "You're in a long corridor that is sparsely lit. You can make out three doors ahead, one at the end which appears to be an exit and two to its sides."
	puts "What do you do?"

	while true
		print ">"
		choice = $stdin.gets.chomp.downcase

		if choice == "show inventory"
			puts "Your inventory includes: #{$inv}"			

		elsif choice == "look around"
 			puts "The walls are cold, unfinished concrete with no windows to it. You can see a big sign with LEVEL 02 sprayed over half of the corridor."
 			puts "Ahead you can see two doors and behind you is just the room you came from."

 		elsif choice == "look doors"
 			puts "Moving towards the doors you see their labels: EXIT, Armory and Security."

 		elsif choice == "go back"
 			first_room

 		elsif choice == "open exit"
 			puts "The door is locked by what appears to be an electronic mechanism. You can't see a keyhole or security terminal."

 		elsif choice == "open security"
 			puts "You use the guards security card to open the door into the security room."
 			security_room
 				
 		else		
 			puts "I don't know what that means."
		end
	end
end

def first_room
	puts "You're in a small room. Behind you is a stretcher which you woke up on."
	puts "Ahead of you is a door, next to it a mutilated body who looks like a guard."
	puts "What do you do?"
		
	while true
		print ">"
		choice = $stdin.gets.chomp.downcase
			
		if choice == "look around"
			puts "The room seems to be a holding cell with very little interior. The walls are covered in blood, most likely from the dead guard next to the door."

		elsif choice == "look stretcher" || choice == "look at stretcher"
			puts "It's a simple steel stretcher with handcuffs attached to it. Someone seemed to have opened the handcuffs before you woke up."		

		elsif choice == "look guard" || choice == "look at guard"
			if $inv.include?("gun") && $inv.include?("yellow card")
				no_interest
			else	
				puts "You look at the mess of what appears to be a guard of the facility. The remainings of him are slumped next to the door."
				puts "Part of his head is missing and you can identify bits of brain splattered across the wall. He also has several deep cuts across his torso which went right through his body armor."
				puts "He's holding a gun in his hand so you figure he shot himself but you have difficulties imagining the origins of his cut wounds."
			end	

		elsif choice == "search guard"
			if $inv.include?("yellow card")
				no_interest
			else 
				puts "You go through the dead guard's pockets and find a yellow keycard"
				$inv << "yellow card"	
			end	

		elsif choice == "take card"
			if $inv.include?("yellow card")
				puts "You have already picked up the card."
			else
				puts "You pick up the yellow key card."	
				$inv << "yellow card"
			end	

		elsif choice == "take gun"
			if $inv.include?("gun")
				puts "You have already picked up the gun."
			else
				puts "You pick up the gun, it's empty."	
				$inv << "gun"
			end			

		elsif choice == "show inventory"
			puts "Your inventory includes: #{$inv}"	

		elsif choice == "look door"
			puts "It's a solid door with a little closed window at the top."
			puts "You can see a card swiper next to the handle."

		elsif choice == "open door" && !$inv.include?("yellow card")
			puts "The door is locked."

		elsif choice == "open door" && $inv.include?("yellow card")
			puts "You swipe the key card and a sounds indictates you that it's open."
			corridor

		else
			puts "I don't understand what that means."
		end
	end
end	

security_room
