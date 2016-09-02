def change_maker(num, arr = [0,0,0,0])
  if num == 0
    arr
  else
    if (num / 25 ) > 0
      arr[0] = num/25
      change_maker(num % 25, arr)
    elsif(num / 10 )> 0
      arr[1] = num/10
      change_maker(num % 10, arr)
    elsif(num / 5 )> 0
      arr[2] = num/5
      change_maker(num % 5, arr)
    else
      arr[3] = num
      change_maker(num % 1, arr)
    end
  end
end

  p change_maker(96)
