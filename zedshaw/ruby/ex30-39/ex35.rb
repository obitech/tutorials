def gold_room
	puts "This room is full of gold. How much do you take?"
	print "> "
	choice = $stdin.gets.chomp

	if choice =~ /[0-9]/
		how_much = choice.to_i
	else
		puts "This is not a number"
		gold_room
	end	

	if how_much < 50
		puts "Nice, you're not greedy, you win!"
		exit(0)
	else
		dead("You greedy bastard!")
	end
end	


def bear_room
	puts """
	There is a bear here.
	The bear has a bunch of honey.
	The fat bear is in front of another door.
	How are you going to move the bear?
	"""
	bear_moved = false

	while true
		print "> "
		choice = $stdin.gets.chomp.downcase

		if choice == "take honey"
			dead("The bear looks at you then slaps your face off.")
		elsif choice.include?("taunt") && !bear_moved
			puts "The bear has moved from the door. You can go thorugh it now."
			bear_moved = true
		elsif choice.include?("taunt") && bear_moved
			dead("The bear gets pissed off and chews your leg off.")
		elsif choice.include?("open") && bear_moved
			gold_room
		else
			puts "I got no idea what that means."
		end	
	end
end

def cthulhu_room
	puts """
	Here you see the great evil Cthulu.
	He, it, whatever stares at you and you go insane.
	Do you flee for your life or eat your head?
	"""

	print "> "
	choice = $stdin.gets.chomp

	if choice.include? "flee"
		start
	elsif choice.include? "head"
		dead("Well that was tasty!")
	else 
		cthulhu_room
	end
end	

def dead(why)
	puts why, "Good job!"
	exit(0)
end

def start
	puts """
	You are in a dark room.
	There is a door to your right and left.
	Which one do you take?
	"""

	print "> "
	choice = $stdin.gets.chomp.downcase

	if choice == "left"
		bear_room
	elsif choice == "right"
		cthulhu_room
	else
		dead("You stumble around the room until you starve.")	
	end
end	

start