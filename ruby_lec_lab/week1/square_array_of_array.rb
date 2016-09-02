# # Given an array of arrays:
# # ?
# # 1
# # array = [[2,3,4], [5,6,7], [6,7,8]]
# #
# # Write a piece of code that will take that array and
# #give back an array of arrays with each element multiplied by itself so you will get back:
# # ?
# # 1
# # [[4, 9, 16], [25, 36, 49], [36, 49, 64]]
#
# a1 = [[2,3,4], [5,6,7], [6,7,8]]
# a2 = []
#
# a1.each do |x|
# sub_array = []
#   if( x.is_a? Array)
#     x.each do |y|
#       sub_array << y * y
#     end
#   else
#     puts "error"
#   end
# a2 << sub_array
# end
#
# puts "your original string is: "
# print a1
# puts
# puts "after conversion it is now: "
# print a2
# puts

a = [[1,2,3],[4,5,6],[7,8,9]]
a = a.flatten
b = a.map {|x| x = x*x).each_slice(3).to_a
print b
puts
