def fib(n)

  a = [1]
  fib_counter = 1

  if n == 0
    puts "N = 0, nothing was returned"

  else
    for i in 1..n
      a << fib_counter
      fib_counter += fib_counter
    end

    return a

  end
end

#main
puts "give me a number N: "
N = gets.chomp.to_i
print fib(N)
puts
