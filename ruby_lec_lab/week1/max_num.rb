def max_num (*numbers)
  numbers.sort!.last
end

p max_num(1,2,3,4,10)

p max_num(7,3)
