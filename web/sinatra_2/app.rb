require "sinatra"
require "sinatra/reloader"
require "pony"
require "./mail_sender.rb"

enable :sessions
use Rack::MethodOverride

helpers do
  def protected!
    return if authorized?
    headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
    halt 401, "Not authorized\n"
  end

  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == ['admin', 'admin']
  end
end

get "/" do
  session[:counter] = (session[:counter] || 0) +1;
  erb :index, layout: :application
end

post "/" do
  session[:background_color] = params["background-color"]
  redirect back
end

post "/contact" do
  MailSender.send(params)
  session[:name] = params[:full_name]
    params.to_s
  end

  get "/special" do
    protected!
    "You're reached a special page!"
  end

  get "/test_redirect" do
    #variables are single request accessible only
    @name = "Jennifer"
    redirect to("/")
  end

  delete "/remove_bg" do
    session[:background_color] = nil
    redirect back
  end
