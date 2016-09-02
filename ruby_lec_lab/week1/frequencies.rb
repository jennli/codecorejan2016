# Given an array of number such as:
# array = [1,2,3,4,4,4,2,3,3,3]
# Write a piece of code that will generate a hash of frequencies that looks like:
# {1 => 1, 2 => 2, 3 => 4, 4 => 3}
# Stretch: Attempt to do the exercise in one line of code using methods like `each_of_object`.


#method
def freq (array)
  my_hash = Hash.new(0)
  array.each {|x| my_hash[x]+=1}
  return my_hash
end

#stretch ?
def freq (array)
array.each_with_object(Hash.new(0)) { |e, a| a[e] += 1 }
end

p freq ([2,2,2,3,3,3,3,3,3,5,5,5,5,5,5,7,4,1])
