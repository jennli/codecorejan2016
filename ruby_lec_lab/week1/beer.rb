require "./food.rb"

class Beer < Food
  def calories
    p @fat * 9 + @protein * 4 + @carbs * 4
  end
end
