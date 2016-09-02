a = [1,2,4,6,44,67,1,67,111343234,1000000]
p a

# #method1
 p a.select{|x| a.count(x) > 1}.uniq


# #method2
hash = Hash.new(0)
a.each { |x| hash[x] += 1}
  p hash.select {|x,y| y > 1}.keys
