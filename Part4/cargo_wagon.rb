require_relative 'wagon'

class CargoWagon < Wagon
  attr_reader :load_capacity

  def initialize(number, load_capacity)
    super(number)
    @load_capacity = load_capacity
    properties['грузоподъемность'.freeze] = load_capacity
  end
end
