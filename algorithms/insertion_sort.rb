def insertion_sort(arr, current_i = 0)
  if current_i  == arr.length-1 || arr.length == 1
    arr
  else
    if arr[current_i] > arr[current_i+1]
      arr[current_i] , arr[current_i + 1] = arr[current_i+1], arr[current_i]
      if current_i > 0
        insertion_sort(arr, current_i-1)
      end
      insertion_sort(arr, current_i + 1)
    end
  end
  arr
end
