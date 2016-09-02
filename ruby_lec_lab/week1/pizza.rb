require "./food.rb"

class Pizza < Food
  def weight
    p @protein + @carbs + @fat
  end
end
