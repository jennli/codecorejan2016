# array = [5,7,4,7,9,0]
#
# array[0], array[1] = array[1], array[0]
#
# array = [7,5,4,7,9,0]

def selection_sort(array)
  min = array[0];
  array.each {|x| min = x if x < min};
  min_index = array.index(min)
  array[0], array[min_index] = array[min_index], array[0]
  
  if array.length > 1
    array[1..-1] = selection_sort(array[1..-1])
  end
  array
end
