require "sinatra"
#this enables us to change the content of the file without having to resart the server. This depends on "sinatra-contrib" gem
require "sinatra/reloader"
require "faker"

get "/" do
  # this will render a template views/index.erb and sends it as a response (this is a Sinatra convention)
  #erb is a ruby method (built-in with Sinatra) that takes ina first argument
  # which is a symbol that references a file name
  # erb(:index) : this method returns a string, which is an html
  @title = "this is from index"
  erb :index, {layout: :app_layout}

  # "<h1>Hello World</h1>"
end

get "/about" do
  "<h1>About my home page</h1>"
end

#Sinatra gives us access to all the GET and POST parameters with a Hash called params
#you are able to access the values with symbols or strings
#so if your UL is http://loalhost:4556/greeting?name=Tam&city=Burnaby
#params will be {"name"=> "Tam", "city"=> "Burnaby"}
#you can access the vlaue of name with: params[:param] or params["name"]


#this is a dynamic url. It will match /greeting/anything
#for example: /greeting/john or /greeting/hello
# get "/greeting/:name" do |name|
#question mark denotes the start of parameters, greeting?name = tam $ city = Burnaby
# name = params[:name]
get "/greeting" do

  # instance variable enables us to access it in the erb template
  @name = params[:name] || "stranger"
  erb :greeting, {layout: :app_layout}
  # city = params[:city]
  #
  # "Hello #{name} in #{city}"
end

# action GET
get "/company" do
  erb :company, layout: :app_layout
end

#action POST
# This will not conflict with the action above because this one is POST request
#The combination of VERB/URL must be unique
post "/company" do
  # "Company Form submitted successfully"
  @phrase = Faker::Company.bs
  erb :company, layout: :app_layout
end

get "/convert" do
  erb :convert, layout: :app_layout

end

post "/convert" do
  # "inside post /convert"
  f = params[:temp_in_c].to_f * 9/5 + 32
  @result = f.to_s 
  erb :convert, layout: :app_layout
end
