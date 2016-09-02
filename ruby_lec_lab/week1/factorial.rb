
def factorial(n)

  if n!=1
    return n * factorial(n-1);
  else
    return 1
  end
end

puts "give me a number: "
n = gets.chomp.to_i
p factorial(n)
