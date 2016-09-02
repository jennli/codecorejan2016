# def sum(array)
#   if array.empty?
#     0
#   else
#     array[0] + sum(array[1..-1])
#   end
# end
#
# my_array = (1..6000).to_a
#
# p sum(my_array)
#

# def factorial(n)
#   if n == 0
#     1
#   else
#     n * factorial(n-1)
#   end
# end
#
# p factorial(5)

# def multiply_arr(arr)
#   if arr.empty?
#      0
#   elsif !arr[0].is_a? Array
#     p arr[0] * arr[0]
#     multiply_arr(arr[1..-1])
#   else
#      multiply_arr(arr[0])
#      multiply_arr(arr[1..-1])
#   end
# end
#
#
# multiply_arr([1,2,3,[4,5],[6,7,8,9]])

def reverse(string)
  if string.empty?
    return ""
  else
    string[-1].to_s + reverse(string[0...-1])
  end
end

p reverse("?!!!!!!$$$$$")
