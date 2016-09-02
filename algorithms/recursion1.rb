def print_num(num)
    puts num
    print_num(num-1) if num > 1
end

print_num(50)
