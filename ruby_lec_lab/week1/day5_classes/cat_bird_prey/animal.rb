class Animal
  attr_accessor :name, :caught_prey

  def initialize(name)
    @name = name
    @caught_prey = false
  end

  def catch_prey(animal)
    p "#{name} is preying"
  end

  def eat(animal)
    p "#{name} is eating"
  end
end
