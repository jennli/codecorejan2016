def user_info (first_name, last_name, age, cities_arr)
  user_hash = {
    first_name: first_name,
    last_name: last_name,
    age: age,
    citities_visited: cities_arr
  }

end

#main
puts "what's your first name?"
first_name = gets.chomp.capitalize

puts "what's your last name?"
last_name = gets.chomp.capitalize

puts "how old are you?"
age = gets.chomp.to_i

cities = []

loop do
  puts "Keep entering the cities you have visited, type 'done' when you are done!"

  city = gets.chomp.capitalize
  break if city == "Done"
  cities << city
end

p user_info(first_name, last_name, age, cities)
