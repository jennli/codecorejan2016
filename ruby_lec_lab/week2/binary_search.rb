require "benchmark"

def search1(array, num)
  if array.size == 1
      if array[0] == num
        true
      else
        false
      end
  else
    mid = array.size / 2
    if array[mid] == num
      true
    elsif array[mid] > num
      search1(array[0...mid], num)
    else
      search1(array[mid+1..-1], num)
    end
  end
end

def search2(array, num)
  if array.size == 1
      if array[0] == num
        true
      else
        false
      end
  else
    mid = array.size / 2
    if array[mid] == num
      true
    elsif array[mid] > num
      search2(array[0..mid], num)
    else
      search2(array[mid..-1], num)
    end
  end
end
#p search([1,2,3,4,5,6,7,8,9,10],11)

Benchmark.bm do|x|
  x.report do
    1000000.times {search1([1,2,3,4,5,6,7,8,9,10], 5 )}
  end
end


Benchmark.bm do|x|
  x.report do
    1000000.times {search2([1,2,3,4,5,6,7,8,9,10], 5 )}
  end
end
