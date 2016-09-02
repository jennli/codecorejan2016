require "sinatra"
require "sinatra/reloader"

get "/" do
  erb :index, layout: :app_layout
end

get "/fizzbuzz" do

  num1 = params["number1"].to_i
  num2 = params["number2"].to_i

  if num1 && num2
    @result = fizzbuzz(num1, num2);
    erb :fizzbuzz, layout: :app_layout
  end

end

def fizzbuzz(num1, num2)

  (1..100).map do |x|
    case true
    when x % num1 == 0 && x % num2 ==0
      "fizzbuzz"
    when x % num1 ==0
      "fizz"
    when x % num2==0
      "buzz"
    else
      x
    end
  end
end
