def method_1(array)
  array.size + 1
end

#number of operations is irrelevant of the number of inputs i have in my arguments
#O(1) constant time regardless of input size
puts method_1([1,2,3])

#O(n) number of operations increase by number of input x
def method_2(array)
  array.each do |x|
    p x
  end
end


#sequantial search : O(n)
def sequential_search(array, number)
  array.each do |x|
    if x == number
      truea
    end
  end
  false
end

# binary search Ologn
