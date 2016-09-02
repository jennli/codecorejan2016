class Cookie

  def initialize(sugar_amount, flour_amount)
    puts "sugar amount is #{sugar_amount}"
    @sugar = sugar_amount
    @flour = flour_amount
  end

  attr_accessor :sugar, :flour
  attr_reader :sugar, :flour

  #getter method
  def get_sugar
    @sugar
  end

  #setter
  def sugar=(new_sugar)
    @sugar = new_sugar
  end


  def self.info
    "I'm the cookie class"
  end

  def detail
    "The cookie has #{@sugar}g of sugar"
  end

  def eat
    "Delicious!"
  end

  def bake
    "Baking the cookie!"
  end

  def b_n_e
    bake_private
  end

  private
  def bake_private
    "baking the cookie secretly"
  end


end
