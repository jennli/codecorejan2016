require "benchmark"

def max_num_l(arr)
  max = arr[0]

  arr.each do |num|
    if num > max
      max = num
    end
  end
  max
end

def max_num_r(arr, n = arr[0])
  if arr.size == 1
    arr[0] < n ? n : arr[0]

  else
    if arr[0] < n
      max_num_r(arr[1..-1], n)
    else
      max_num_r(arr[1..-1], arr[0])
    end
  end
end

# p max_num_r([1,2,3,4,5,4,3])
Benchmark.bm do|x|
  x.report do
    1000000.times {max_num_l([10,9,1,2,3,7,11].to_a)}
  end
end

Benchmark.bm do|x|
  x.report do
    1000000.times {max_num_r([10,9,1,2,3,7,11])}
  end
end
