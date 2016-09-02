require "benchmark"

def print_loop
  (1..50).each {|x| x}
end

# def print_recursion()
#   recursion_helper((1..50).to_a)
# end
#
#
#
#
#
# def recursion_helper(array)
#   # puts ">>>>>> array #{array}"
#   if array.size == 0
#     return
#
#   elsif array.size == 1
#     puts array[0]
#   else
#     mid = array.size / 2
#     recursion_helper(array[0..mid-1])
#     recursion_helper(array[mid..-1])
#   end
# end

def print_recursion(num, maxnum)
  if num == maxnum
    return maxnum
  else
     num
    print_recursion(num + 1, maxnum)
  end
end

#p print_loop
#print_recursion

Benchmark.bm do|x|
  x.report do
    1000000.times {print_loop()}
  end
end


Benchmark.bm do|x|
  x.report do
    1000000.times {print_recursion(1, 50)}
  end
end
