def by_five?(n)
  n % 5 == 0
end

puts "give me a number: "
num = gets.chomp.to_i
p by_five?(num)
