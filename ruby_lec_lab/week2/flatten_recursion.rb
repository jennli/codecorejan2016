def flatten_r(array)
  if array.empty?
    array
  elsif array.size == 1
    if array[0].is_a? Array
      flatten_r(array[0])
    else
      array
    end

  else
    if array[0].is_a? Array
      flatten_r(array[0]) + flatten_r(array[1..-1])
    else
      [array[0]] + flatten_r(array[1..-1])
    end
  end
end

p flatten_r([1,2,[3,4,5],[6,7,8, [9,10]],[1,2,3],[]])
