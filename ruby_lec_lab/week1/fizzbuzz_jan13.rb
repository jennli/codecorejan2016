=begin
#
# def fizzbuzz (word1, word2)
# fizzbuzz_array = Array.new
#
#   for n in 1..100
#     if n % 3 == 0 && n % 5 == 0
#       fizzbuzz_array[fizzbuzz_array.length] = (word1 + word2)
#     elsif n % 3 == 0
#       fizzbuzz_array[fizzbuzz_array.length] = word1
#     elsif n % 5 == 0
#       fizzbuzz_array[fizzbuzz_array.length] = word2
#     else
#       fizzbuzz_array[fizzbuzz_array.length] = n
#     end
#
#   end
#
#   return fizzbuzz_array
# end
#
#
#
# puts "what would you like to print if the number is divisible by 3?"
# word1 = gets.chomp
#
# puts "what would you like to print if the number is divisible by 5?"
# word2 = gets.chomp
#
# puts
# puts fizzbuzz(word1, word2)
=end

class Fizzers

  def self.fizzbuzz
    #  1.upto(100).collect
    1.upto(100).map do |n|
      case 0
      when n % 15
        "FIZZBUZZ"
      when n % 5
        "BUZZ"
      when n % 3
        "FIZZ"
      else
        n
      end
    end
  end

  def fizzbuzz.stretch(max, word_for_div3="Fizz" )
  end

  def fizzbuzz_stretch_positional_verbose(max, word_for_div3, word_for_div5, word_for_div15)
    fizzbuzz_stretch(max:max, word_for_div3:word_for_div3, word_for_div5:word_for_div5, word_for_div15:word_for_div15)

  end


  def self.fizzbuzz_stretch(max:100, word_for_div3:"FIZZ", word_for_div5:"BUZZ", word_for_div15:nil)
    word_for_div15 ||= [word_for_div3, word_for_div5].join
    1.upto(max).map do |n|
      case 0
      when n % 15
        "FIZZBUZZ"
      when n % 5
        "BUZZ"
      when n % 3
        "FIZZ"
      else
        n
      end
    end


  end

end
