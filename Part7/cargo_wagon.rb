require_relative 'wagon'

class CargoWagon < Wagon
  INVALID_CAPACITY_MESSAGE = 'Грузоподъемность выходит за допустимые пределы 0..40000'

  attr_reader :load_capacity

  def initialize(number, load_capacity)
    @load_capacity = load_capacity.to_f
    @properties << "грузоподъемность: #{load_capacity}"
    super(number)
  end

  protected

  def validate!
    super
    raise ArgumentError, INVALID_CAPACITY_MESSAGE unless load_capacity.between?(0, 40000)
  end

end
