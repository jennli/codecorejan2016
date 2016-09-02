class Animal
  attr_accessor :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end

  def walk
    puts "I'm walking"
  end

  def eat
    puts "I'm eating"
  end
end
