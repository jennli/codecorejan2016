
age = 0

puts "What's your first name? "
first_name = gets.chomp.capitalize

puts "What's your last name?"
last_name = gets.chomp.capitalize

puts "Which city were you born?"
city = gets.chomp.capitalize

loop do age == 0
  puts "How old are you?"
  age = gets.chomp.to_i
  break if age > 0
end

hash = {
  first_name: first_name,
  last_name: last_name,
  birth_city: city,
  age: age
}

#puts hash.keys.each {|x| puts "#{x}: #{hash[x]}"  }

puts "Your name is #{hash[:first_name]} #{hash[:last_name]}"
puts "You were born in #{hash[:birth_city]}"
puts"you are #{hash[:age]} years old. "
