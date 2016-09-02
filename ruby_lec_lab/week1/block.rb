def my_method
  puts "Hello"
  yield if block_given?
  puts "Bye"
end


my_method do
  puts "Hey, What's up!"
end
