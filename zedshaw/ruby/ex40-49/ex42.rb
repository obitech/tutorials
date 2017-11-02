## Animal is-an object look at the extra credit
class Animal
	def what
		puts "I'm an Animal"
	end
end

## Dog is-an Animal
class Dog < Animal
	def initialize(name)
		## A dog has-a name
		@name = name
	end

	def what
		puts "I'm a Dog"
		super
	end	
end	

## Cat is-an Animal
class Cat < Animal
	def initialize(name)
		## A cat has-a name
		@name = name
	end
end

## Person is-an object
class Person
	def initialize(name)
		## A Person has-a name
		@name = name

		## Person has-a pet of some kind
		@pet = nil

		## Person has-a child of some kind
		@child = nil
	end

	attr_accessor :pet, :child
end	

class Child < Person

	def initialize(name)
		super(name)

		## Creating hash in instance of class
		@toy = Hash.new
	end
	
	def toy(name, type, color)
		@toy = {
			'name' => name,
			'type' => type,
			'color' => color
		}	
	end

	def toy_check
		@toy.each do |k, v|
			puts "#{k}: #{v}"
		end
	end	
end	

class Employee < Person

	def initialize(name, salary)
		## ??
		super(name)
		## Employee has-a salary
		@salary = salary
	end

	def hello
		puts "Hi, I'm #{@name} and I earn #{@salary}."
	end

	def porsche
		prize = 500000
		if @salary > prize
			puts "A porsche costs #{prize} and my salary is #{@salary}."
			puts "I can buy a Porsche"
		else
			puts "I need to earn more!"	
		end
	end

end	

## Fish is-a object
class Fish
end

## Salmon is-a fish
class Salmon < Fish
end

## Halibut is-a fish
class Halibut < Fish
end

## rover is-a Dog
rover = Dog.new("Rover")
rover.what 

## satan is-a Cat
satan = Cat.new("Satan")

## mary is-a Person
mary = Person.new("Mary")

## elly is-a child 
elly = Child.new("Elly")

## elly has-a toy
elly.toy("Jon", "Car", "Brown")
elly.toy_check()

## mary has-a child named elly
mary.child = elly

## mary has-a pet satan
mary.pet = satan

## frank is-a Employee and has-a name (Frank) and has-a salaray (120k)
frank = Employee.new("Frank", 120000)

jon = Employee.new("John", 10000000)

## frank has-a pet that has a name rover
frank.pet = rover

## flipper is-a object of fish
flipper = Fish.new()

## salmon is-a fish that has-a salmon called crouse
crouse = Salmon.new()

## salmon is-a fish that has-a Halibut called harry


































