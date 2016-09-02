require "./animal.rb"


class Cat < Animal

  def catch_prey(animal)
    super
    puts "#{name}: Haha I caught #{animal.name}!"
  end

  def eat(animal)
    super
    puts "#{name}: I'm eating #{animal.name}!"
  end



end
