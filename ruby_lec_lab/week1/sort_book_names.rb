  array_words = []

loop do
  puts "please enter some book names one at a time, hit exit when you are done"
  name = gets.chomp
    break if name.upcase == "EXIT"
    array_words << name

end

puts
puts array_words.map{|x| x.capitalize}.sort
