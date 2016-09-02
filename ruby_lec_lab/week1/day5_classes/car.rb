class Car

  def initialize(model, type, capacity)
    @model = model
    @type = type
    @capacity = capacity

#parallel assignment
@model, @type, @capacity = model, type, capacity

  end

  def self.max_speed
    200
  end

  def self.drive
    pump_gas
    ignite_eng
    "I'm driving!"
  end

  def self.park
    "I'm parking! "
  end

  def stop
    "I stopped!"
  end

  private

  def self.pump_gas
    puts  "secretly pumping gass"
  end

  def self.ignite_eng
    puts  "secretly igniting engine"
  end


end
