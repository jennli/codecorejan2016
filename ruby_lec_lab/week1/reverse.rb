##method
#puts "please give me a word and i will reverse it!"
#word = gets.chomp
#
# "are"
# 3
# 0 1 2
#
# index = word.size-1
# reversed = []
#
# while index >=0
#   reversed << word[index]
#   index -=1
# end
#
# print reversed*""
# puts

# #method 2
# puts "please give me a word and i will reverse it!"
# word = gets.chomp
#
# reversed = []
#
# word.split("").each do |x|
#   reversed.insert(0,x)
# end
#
# print reversed.join
# puts

#array reverse
a = [1,2,3,4,5]
b = []

a.each {|x| b.insert(0, x)}

puts "your original array is #{a}"
puts "reversed array: #{b}"
