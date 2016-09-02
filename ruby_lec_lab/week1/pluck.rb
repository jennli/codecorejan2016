def pluck (arr, name)
  result_array =  arr.map {|x| x[name.to_sym]}.compact

  if result_array.size == 0
    return "undefined"
  else
    return result_array
  end
end

array = [{a:5},{b:"x"}, {c:"m", a:"haha"}, {a:7}]


p pluck(array, "f" )
