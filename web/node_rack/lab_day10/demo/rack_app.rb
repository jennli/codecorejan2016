require "rack"

class ReverseApp
  def self.call(env)
    request = Rack::Request.new(env)
    params  = request.params
    reverse = params["word"].reverse
    [200, {"Content-Type" => "text/html"}, ["<h1>Reverse: #{reverse}</h1>"]]
  end
end

Rack::Handler::WEBrick.run ReverseApp
