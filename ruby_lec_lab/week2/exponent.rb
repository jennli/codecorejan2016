def exp (n, e)
  if e == 0
    1
  else
    n * exp(n, e-1)
  end
end
p exp(2, 6)
