# a = "abcdefgh"
# print a.scan(/.{2}/)
# puts

a = "abcdefgh"

counter = 0

b = a.split("")
c = []

while counter < a.size - 1
  c << b[counter]+b[counter+1]
  counter += 1
end

print c
puts
