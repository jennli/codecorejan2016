begin
  10/0
rescue ZeroDivisionError => e
  puts "I caught zero division error: #{e.message} / #{e.backtrace}"
rescue
  puts "unkown"
end
