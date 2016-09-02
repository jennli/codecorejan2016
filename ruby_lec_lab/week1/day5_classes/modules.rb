#Modules as namespaces
module Computer
  class Apple
  end
end

module Fruit
  class Apple
  end
end

mac = Computer::Apple.new
gala = Fruit::Apple.new

#or

class Computer::Apple
end

class Fruit::Apple
end

module HelperMethods
  def name_display
    name.squeeze(" ").capitalize
  end
end

class Car
  attr_accessor :name
  #include will bring all the methods from the module
  #to this class as instance methods
  include HelperMethods
end

class User
  attr_accessor :name
  extend HelperMethods
end

c = Class1.new
c.greeting("John")
User.greeting("John")
