my_name = 'Zed A. Shaw'
my_age = 35 #not a lie in 2009
my_height = 74.0 #inches
my_weight = 180.0 #lbs
my_eyes = 'Blue'
my_teeth = 'White'
my_hair = 'Brown'

new_height = my_height * 2.54
new_weight = my_weight * 0.454

puts "Let's talk about #{my_name}"
puts "He's #{my_height} inches tall (#{new_height}cm)"
puts "He's #{my_weight} punds heavy (#{new_weight}kg)"
puts "He's got #{my_eyes} eyes and #{my_hair} hair"
puts "His teeth are usually #{my_teeth.downcase} depending on the coffee."

puts "If I add #{my_age}, #{my_height} and #{my_weight} I get #{my_age + my_height + my_weight}"
