def prime(n, x=2)

  if x > Math.sqrt(n)
    true
  elsif n % x == 0
    false
  else
    prime(n, x+1)
  end
end


p prime(13)
p prime(5)
p prime(53)

p prime(23244)
p prime(9)
p prime(10)
