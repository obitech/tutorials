states = {
	"Sachsen" => "S",
	"Sachsen-Anhalt" => "SA",
	"Thuringen" => "TH",
	"Hamburg" => "HH",
	"Bremen" => "BB",
	"Bayern" => "BA"
}

cities = {
	"S" => "Leipzig",
	"SA" => "Magdeburg",
	"TH" => "Weimar",
	"BA" => "Munich"
}

cities["HS"] = "Wiesbaden"

puts "-" * 10
states.each do |state, abbrev|
	puts "The abbreviation for #{state} is #{abbrev}"
end

puts "-" * 10
states.each	do |state, abbrev|
	city = cities[abbrev]
	if city != nil
		puts "The state #{state} has the abbreviation #{abbrev} and city #{city}"
	else
		puts "The state #{state} has the abbreviation #{abbrev} but I can't find a city in my records."	
	end	
end	