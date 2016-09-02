require "./cookie.rb"

#Oreo inherits from Cookie
#Oreo is the child class or subclass
#Cookie is the parent class or superclass
class Oreo < Cookie
  attr_accessor :filling_type

  #This overrides the 'eat' method
  def eat
    puts "Eating the oreo cookie~~"
    super
  end
end
