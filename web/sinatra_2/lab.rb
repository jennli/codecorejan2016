require "sinatra"
require "sinatra/reloader"

enable :sessions

get "/" do
  erb :lab_index, layout: :lab_layout
end

get "/largestnumber" do
  erb :largest_number, layout: :lab_layout
end

post "/largestnumber" do
  @max_num = params["numbers"].split(",").map{|x| x.to_i}.max
  erb :largest_number, layout: :lab_layout
end

get "/billsplitter" do

  erb :bill_splitter, layout: :lab_layout
end

post "/billsplitter" do

  if(params["ppl"].to_i == 0)
    @share = "you must have at least one person pay for this bill!"
  else
    @share = (params["amount"].to_f * (1+ params["tax"].to_f/100) * (1 + params["tip"].to_f/100)/ params["ppl"].to_f).round(2)
  end
  erb :bill_splitter, layout: :lab_layout
end

get "/selectlanguage" do
  erb :select_language, layout: :lab_layout
end

post "/selectlanguage" do

  @greeting = {
    "english"=> "Hello",
    "french"=> "Bonjour",
    "spanish"=> "Hola"
  }

  session[:language] = params["language"]
  session[:name] = params["name"]
  session[:greeting] = @greeting[ session[:language]]

  redirect to("/")
end

get '/entertask' do
  erb :enter_task, layout: :lab_layout
end

post "/entertask" do
  session[:tasks] ||= Hash.new;
  @current_user = session[:name]
  session[:tasks][@current_user] ||= Set.new;
  session[:tasks][@current_user].add(params["task-detail"])

redirect to "/listmytasks"
end

get "/listmytasks" do
  session[:tasks] ||= Hash.new;
  @current_user = session[:name]
  session[:tasks][@current_user] ||= Set.new;
  erb :list_tasks, layout: :lab_layout
end

post "/addnote" do
  session[:notes] ||= Hash.new;
  @current_user = session[:name]
  session[:notes][@current_user] ||= Hash.new

  @title = params["title"]
  @body = params["body"]
  session[:notes][@current_user][@title] = @body
  session[:notes][@current_user]

  redirect to "/listmynotes"
end

get "/addnote" do
  erb :add_note , layout: :lab_layout
end


get "/listmynotes" do
  session[:notes] ||= Hash.new;
  @current_user = session[:name]
  session[:notes][@current_user] ||= Hash.new
  erb :list_notes , layout: :lab_layout
end
