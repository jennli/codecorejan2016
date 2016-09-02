class Fizzbuzz

  attr_accessor :fizz_num, :buzz_num

  def initialize(fizz_num, buzz_num)
    @fizz_num, @buzz_num = fizz_num, buzz_num
  end

  def run

    (1..100).map do |num|
      case 0
      when num % fizz_num.to_f && num % buzz_num.to_f
        "fizzbuzz"
      when num % fizz_num.to_f
        "fizz"
      when num % buzz_num.to_f
        "buzz"
      else
        num
      end

    end
  end
end
