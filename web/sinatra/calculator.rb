require "sinatra"
require "sinatra/reloader"

get "/" do
  erb :index, layout: :app_layout

end


get "/calculate" do
  erb :calculator, layout: :app_layout

end

post "/calculate" do
  num1 = params["num1"].to_f
  num2 = params["num2"].to_f
  operation = params["operation"]
  @result = calculate(num1, num2, operation)



  erb :calculator, layout: :app_layout
end

def calculate(num1, num2, operation)
  case operation
  when "add"
    num1 + num2
  when "subtract"
    num1 - num2
  when "multiply"
    num1 * num2
  when "divide"
    if num2 == 0
      "You cannot divide any number by 0"
    else
      num1 / num2
    end
  end
end
