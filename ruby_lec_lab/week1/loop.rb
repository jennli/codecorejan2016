# a = ["jack", "lily", "david", "tom", "kim"]
#
# a.each do |x|
#  puts x.capitalize
# end

#desctructive
#
# sentence = "what is going on"
# words = sentence.split.map {
# |word| word.capitalize
# }.join(" ")

words_array = []

loop do
  puts "enter some words one at a time, and type 'exit' when you are done"
  word = gets.chomp

  break if word.upcase == "EXIT"

  words_array << word
end

array_size = words_array.size

puts "you have entered #{array_size} words, they are: "

i = 0
words_array.each do |x|
  i += 1
  puts "#{i}. #{x}"
end
