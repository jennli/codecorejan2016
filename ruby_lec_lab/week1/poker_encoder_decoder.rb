=begin
c    |     d     |    h     |    s
---------------------------------------
0: A      13: A      26: A      39: A
1: 2      14: 2      27: 2      40: 2
2: 3      15: 3      28: 3      41: 3
3: 4      16: 4      29: 4      42: 4
4: 5      17: 5      30: 5      43: 5
5: 6      18: 6      31: 6      44: 6
6: 7      19: 7      32: 7      45: 7
7: 8      20: 8      33: 8      46: 8
8: 9      21: 9      34: 9      47: 9
9: T      22: T      35: T      48: T
10: J     23: J      36: J      49: J
11: Q     24: Q      37: Q      50: Q
12: K     25: K      38: K      51: K
=end

def encode (hash, arr)
  # puts "encoding"
  arr.map{ |symbol| hash[symbol]}.sort
end

def decode (hash, arr)
  arr.sort.map {|code|hash.key(code)}
end


def poker (arr)
  poker_hash = {
    "Ac" => 0,
    "2c" => 1,
    "3c" => 2,
    "4c" => 3,
    "5c" => 4,
    "6c" => 5,
    "7c" => 6,
    "8c" => 7,
    "9c" => 8,
    "Tc" => 9,
    "Jc" => 10,
    "Qc" => 11,
    "Kc" => 12,

    "Ad" => 13,
    "2d" => 14,
    "3d" => 15,
    "4d" => 16,
    "5d" => 17,
    "6d" => 18,
    "7d" => 19,
    "8d" => 20,
    "9d" => 21,
    "Td" => 22,
    "Jd" => 23,
    "Qd" => 24,
    "Kd" => 25,

    "Ah" => 26,
    "2h" => 27,
    "3h" => 28,
    "4h" => 29,
    "5h" => 30,
    "6h" => 31,
    "7h" => 32,
    "8h" => 33,
    "9h" => 34,
    "Th" => 35,
    "Jh" => 36,
    "Qh" => 37,
    "Kh" => 38,

    "As" => 39,
    "2s" => 40,
    "3s" => 41,
    "4s" => 42,
    "5s" => 43,
    "6s" => 44,
    "7s" => 45,
    "8s" => 46,
    "9s" => 47,
    "Ts" => 48,
    "Js" => 49,
    "Qs" => 50,
    "Ks" => 51,
  }

  if (!arr.is_a? Array)
    null
  else
    arr.sort!
  end

  if arr.first.is_a? Fixnum
    decode(poker_hash,arr)
  elsif arr.first.is_a? String
    final_array.push(encode(poker_hash,x))
  else
    null
  end

end
if encoded
  final_array.sort()
elsif decoded
  final_array
end


arr = ['Ac','Ks', '5h', 'Td', '3c']
#arr2 = [0, 51, 30, 22, 2]
p poker(arr)
