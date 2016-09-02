require "./bone.rb"

class Dog
  attr_accessor :color, :type, :bone_arr

  def initialize(color, type)
    @color = color
    @type = type
    @bone_arr = []
    puts "I'm a #{color} #{type}!"
  end

  def give(bone)

    if bone_arr.size >= 3
      puts "I have too many bones!"
    else
      puts "I got a bone!"
      bone_arr.push(bone)
    end
  end

  def eat
    if bone_arr.size > 0
      puts "yummy! I ate a #{bone_arr.pop.size} bone"
    else
      puts "I have no bones left!"
    end
  end
end
