require "./cat.rb"
require "./bird.rb"
require "./helper_method.rb"

class CatBirdPrey
include HelperMethod

  attr_accessor :cat_name, :bird_name, :cat, :bird

  def  initialize(cat_name, bird_name)
    @cat = Cat.new(cat_name)
    @bird = Bird.new(bird_name)
  end

  def prey
    if caught
      cat.catch_prey(bird)
      cat.eat(bird)
    else
      "#{cat.name}: I didn't catch #{bird.name}"
    end
  end
end
