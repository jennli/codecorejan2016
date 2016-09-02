# require 'benchmark'
#
# n = 10000000
#
# # Run 1
# Benchmark.bm do |x|
#   x.report do
#     n.times do
#       array = [1,2,3,4,5,6,7,8,9,10]
#       array.push(11)
#       array.push(12)
#       array.push(13)
#     end
#   end
# end
#
# # Run 2
# Benchmark.bm do |x|
#   x.report do
#     n.times do
#       array = [1,2,3,4,5,6,7,8,9,10]
#       array.insert(2, 11)
#       array.insert(2, 12)
#       array.insert(2, 13)
#     end
#   end
# end

require "benchmark"

array = [34, 24, 45, 6, 6, 77, 19]

Benchmark.bm do |x|
  x.report do
    30_000_000.times do
      number = array.delete_at(3)
      array.insert(2, number)
    end
  end
end

Benchmark.bm do |x|
  x.report do
    30_000_000.times do
      temp     = array[2]
      array[2] = array[3]
      array[3] = temp
    end
  end
end

Benchmark.bm do |x|
  x.report do
    30_000_000.times do
      array[2], array[3] = array[3], array[2]
    end
  end
end
