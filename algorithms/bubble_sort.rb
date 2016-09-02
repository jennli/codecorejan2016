# def bubble_sort(array)
#   swapped = false
#   for i in (0..array.length-2)
#     if array[i] > array[i + 1]
#       array[i], array[i+1] = array[i+1], array[i]
#       swapped = true
#     end
#   end
#   if swapped
#     bubble_sort(array)
#   else
#     array
#   end
# end


def bubble_sort(array)
  loop do
    continue = false;
    for i in (0..array.length-2)
      if array[i] > array[i + 1]
        array[i], array[i+1] = array[i+1], array[i]
        continue = true
      end
    end
    break unless continue
  end
  array
end


# puts bubble_sort([5,4,3,2,1])
puts bubble_sort([4,2,5,1,2].shuffle)
