require "rack"

class TemperatureConverterApp

  def self.call(env)

    request = Rack::Request.new(env)
    params = request.params
    temp_f = params["temp"]
    temp_c = f_to_c(temp_f.to_i)

    [200, {"Content-Type"=>"text/html"}, ["#{temp_f} F = #{temp_c} C"] ]

  end

  def self.f_to_c(temp)
    (temp - 32) * 5/9
  end
end

Rack::Handler::WEBrick.run TemperatureConverterApp
