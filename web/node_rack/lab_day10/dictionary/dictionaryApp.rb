require "rack"
#
Rack::File.new("/dictionary.txt")
class Dictionary
  def self.call(env)
    req = Rack::Request.new(env)
    # p env
    case req.path_info
    when /search/
      params = req.params
      word = params["word"].capitalize
      definition = "Sorry, your word is not found in the dictionary"
      file="dictionary.txt"
      f = File.open(file, "r")

      f.each_line do |line|
        if line.start_with?(word)
          definition = line
          break
        end
      end
      f.close
      [200, {"Content-Type" => "text/html"}, ["<p>#{definition}</p>"]]

    else
      [200, {"Content-Type" => "text/html"}, ["<h1>Welcome to Dictionary!</h1>"]]
    end
  end
end

Rack::Handler::WEBrick.run Dictionary
