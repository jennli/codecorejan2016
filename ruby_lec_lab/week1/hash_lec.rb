# # cities = {"BC" => ["vancouver", "richmond"], "AB" => ["Edmonton", "Calgary"]}
# #
# # cities.each do |province, c|
# #   puts "#{province}: #{c.join(",")}"
# # end
#
# cities_2 = {
#   "BC" => ["vancouver", "richmond", "Burnaby"],
#   "AB" => ["Edmonton", "Calgary", "Lethbridge"],
#   "ON" => ["Toronto", "Missisauga", "Ottawa"]
# }
#
#
# a = {
#   "First Name" => "Jennifer",
#   "Last Name" => "Li",
#   "Age" => 25
# }
#
# b = {
#   "First Name" => "William",
#   "Last Name" => "Wang",
#   "Age" => 25
# }
#
# hash_array = [a, b]
#
# p hash_array
#
# hash_array.each do |x|
#   x.values_at("Last Name", "Age")
#   puts
# end
#
# hash with symbol
# me = {:name => "Michael", :last_name => "Johnson"}
# me2 = {name: "Michael", last_name: "Johnson"}
#
# p me
# p me2
#
# brands = {
# sony: "electronics",
# mercedes: "cars",
# nike: "sportswear"
# }
#
# p brands

#create a method that converts an array of strings to a hash with
#the string values converted to symbols as keys and values are the length of the string values
# array = ["hello", "greetings", "hola", "hi"]
#
# def array_to_hash (array)
#   # hash = {}
#   # array.each do |x|
#   #   hash[x.to_sym] = x.size
#   # end
#   #
#   # return hash
#   Hash[array.map{|x| [x.to_sym, x.length]}]
# end
#
#
# puts "give me a list of key strings separated by ','"
# str = gets.chomp
# array = str.split(",")
# p array_to_hash(array)


#create a method that takes the hash and prints large if the city is > 100,000 or small otherwise

population = {
  vancouver: 2135201,
  victoria: 316327,
  abbotsford: 149855,
  kelowna: 141767,
  nanaimo: 88799,
  white_rock:8236,
  kamloops:73472,
  chilliwack:66382
}

population.each do |city, pop|
  size = pop >100000? "large": "small"
  puts "The city #{city} is #{size}"
end
