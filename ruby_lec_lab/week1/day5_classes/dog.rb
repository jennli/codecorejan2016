require "./animal.rb"

class Dog
  attr_accessor :color, :type

  def initialize(color, type)
    @color = color
    @type = type
  end

  # def give(bone)
  #
  #   if bone_arr.size >= 3
  #     puts "I have too many bones!"
  #   else
  #     puts "I got a bone!"
  #     bone_arr.push(bone)
  #   end
  # end
  def bark
    puts "woof!"
  end
  
  def eat
    super
    puts "Bones are yummy!"
  end
