class	Scene
	def enter()
	end	
end

class	Engine

	def initialize(scene_map)
		@scene_map = scene_map
	end	

	def play()
		
	end
end

class Death < Scene

	@@deaths = [
	"You're horrible at this.",
	"Shit, again? Loser!",
	"Maybe try play Solitaire again, because you DIED",
	"Sorry, you're dead. Idiot.",
	"How often do you want to try again?",
	"Maybe next time will be better right?",
	]

	def enter()
		puts @@deaths[rand(0..(@@deaths.length - 1))]
		exit(1)
	end	

end

class CentralCorridor < Scene	

	def enter()
		puts enter()
		puts "The Gothons of Planet Percal #25 have invaded your ship and destroyed"
		puts "your entire crew. You are the last surviving member and your last"
		puts "mission is to get the neutron destruct bomb from the Weapons Armory,"
		puts "put it in the bridge and blow the ship up after getting into an "
		puts "escape pod."
		puts "\n"
		puts "You're running down the central corridor to the Weapons Armory when"
		puts "a Gothon jumps out, red scaly skin, dark drimy teeth and evil clown costume"
		puts "flowing around his hate filled body. He's blocking the door to the"
		puts "Armory and about to pull a weapon to blast you."
		puts "What do you want to do? (shoot, dodge or tell a joke?)"
		print "> "

		action = $stdin.gets.chomp.downcase

		if action == "shoot"
			puts "Quick on the draw you yank out your blaster and fire it at the Gothon."
			puts "His clow costume is flowing and moving around his body, which throws"
			puts "off your aim. Your laser hits his costume but misses him entirely. This"
			puts "completely ruins his brand new costume his mother bought him, which"
			puts "makes him fly into an insane rage and blas you repeatedly in the face until"
			puts "you're dead. Then he eats you."
			return 'death'

		elsif action == "dodge"
			puts "Like a world class boxer you dodge, weave, slip and slide right"
			puts "as the Gothon's blaster cranks a laser past your head."
			puts "In the middle of your artful dodge your foot slips and you"
			puts "bang your head on the metal wall and pass out."
			puts "You wake up shortly after only to die as the Gothon stomps on"
			puts "your head and eats you."
			return 'death'

		elsif action = "tell a joke"
			puts "Lucky for you they made you learn Gothon insults in the academy."
			puts "You tell the one Gothon joke you know:"
			puts "Lghasd Lasj vjs JSde jasd jWJejs vms, fjvfg jfs? Asktp fke zou!"
			puts "The Gothon stops, tries not to laugh, then bursts out laughing and can't move."
			puts "While he's laughing you run up and shoot him square in the head."
			puts "putting him down, then jump through the Weapon Armory door."
			return 'finished'

		else
			puts "DOES NOT COMPUTE!"
			return 'central_corridor'
		end				
	end
end

class LaserWeaponArmory < Scene	

	def enter()
		puts "You do a dive roll into the Weapon Armory, crouch and scan the room"
		puts "for more Gothons that might be hiding. It's dead quiet, too quiet."
		puts "You stand up and run to the far side of the room and find the"
		puts "neutron bomb in its container. There's a keypad lock on the box"
		puts "and you need the code to get the bomb out. If you get the code"
		puts "wrong 10 times then the lock closes forever and you can't"
		puts "get the bomb. The code is 3 digits."
		code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
		print "[keypad]>"
		guess = $stdin.gets.chomp
		guesses = 0

		while guess != code && guesses < 10
			puts "ACCESS DENIED!"
			guesses += 1
			guess = $stdin.gets.chomp
		end	

		if guess = code
			puts "The container clicks open and the seal breaks, letting the gas out."
			puts "You grab the neutron bomb and run as fast as you can to the"
			puts "bridge where you must place it in the right spot."
			return 'the_bridge'

		else
			puts "The lock buzzes one last time and the you hear a sickening"
			puts "melting sound as the mechanism is fused together."
			puts "You decide to sit there and finally the Gothons blow up the"
			puts "ship from their ship and you die."
			return 'death'	
		end	
	end
end

class TheBridge < Scene

	def enter()
	end
end

class EscapePod < Scene

	def enter()
		
	end
end

class Finished < Scene

	def enter()
		puts "You won!"
		exit(1)
	end
end	

class Map

	@@scenes = {
		'central_corridor' => CentralCorridor.new(),
		'laser_weapon_armory' => LaserWeaponArmory.new(),
		'the_bridge' => TheBridge.new(),
		'escape_pod' => EscapePod.new(),
		'death' => Death.new(),
		'finished' => Finished.new(),
	}

	def initialize(start_scene)
		@start_scene = start_scene
	end

	def next_scene (scene_name)
		val = @@scenes[scene_name]
		return val
	end
	
	def opening_scene()
	end
end

a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
a_game.play()















