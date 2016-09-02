require "sinatra"
require "sinatra/reloader"

get "/" do
  erb :index, layout: :app_layout
end

get "/car" do

  erb :car, layout: :app_layout

end

post "/car" do
  @status = calculate_year(params["year"].to_i)
  erb :car, layout: :app_layout
end

def calculate_year(year)
  case true

  when year > 2016
    "future"
  when year > 2010
    "new"
  when year > 2005
    "old"

  else
    "very old"
  end
end
