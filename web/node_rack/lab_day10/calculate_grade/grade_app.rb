require "rack"

class CalculateGradeApp
  def self.call(env)
    request = Rack::Request.new(env)
    params = request.params
    grade = calcualteGrade(params["grade"].to_i)

    [200, {"Content-Type" => "text/html"}, ["#{grade}"]]

  end

  def self.calcualteGrade(score)
    case true
    when score > 100
      "Your score is greater than 100?? That's impossible!"
    when score < 0
      "Your score is negative? That's impossible"
    when score >= 90
      "A"
    when score >= 80
      "B"
    when score >= 70
      "C"
    when score >= 60
      "D"
    else
      "F"
    end
  end
end

Rack::Handler::WEBrick.run CalculateGradeApp
