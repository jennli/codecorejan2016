
def return_greater_than_ten (array)
  result_array = []

  array.each do |x|

    if x.is_a? Integer
      if x > 10
        result_array << x
      end
    end
  end

  return result_array

end

#main
array = [20, 5, 11, "haha", 44, 10, 9]

puts "Your original array is: "
print array
puts

puts "array of values greater than 10: "
print return_greater_than_ten(array)
puts
