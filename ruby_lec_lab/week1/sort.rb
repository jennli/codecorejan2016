a = [1,5,23,77,4,6,33,52,3,9]

for i in 0...a.size-1
  position = i
  d = i + 1
  for m in d...a.size

    if a[position] > a[m]
      position = m
    end
  end
  if position != i
    swap = a[i]
    a[i] = a[position]
    a[position] = swap
  end


end

p a
