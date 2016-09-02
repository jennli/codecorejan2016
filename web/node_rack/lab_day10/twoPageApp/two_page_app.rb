require "rack"

class TwoPageApp

  def self.call(env)
    request = Rack::Request.new(env)

    fullpath = request.fullpath

    # if fullpath == "/greeting"
    if fullpath.match(/^\/greeting(\?)?/)
      params = request.params
      name = params["name"]

      # if the argument "name" exists in the url, print hello name
      if name
        [200, {"Content-type"=>"text/html"}, ["<h1>Hello #{name}!</h1>"]]

        # if the argument "name" does not exist in the url, ask for the name
      else
        [200, {"Content-type"=>"text/html"}, ["<h1>What is your name?</h1>"]]
      end

      #when fullpath == "/", print welcome
    elsif fullpath == "/"
      [200, {"Content-type"=>"text/html"}, ["<h1>Welcome to my application!</h1>"]]

      # everything else should give a 404 page not found error
    else
      [404, {"Content-type"=>"text/html"}, ["<h1>404 page not found</h1>"]]
    end
  end
end

Rack::Handler::WEBrick.run TwoPageApp
