require_relative 'wagon'

class CargoWagon < Wagon
  attr_reader :load_capacity

  def initialize(number, load_capacity)
    @load_capacity = load_capacity.to_f
    @properties << "грузоподъемность: #{load_capacity}"
    super(number)
  end

  private

  def validate!
    super
    invalid_capacity_message = 'Грузоподъемность выходит за допустимые пределы 0..40000'
    raise ArgumentError, invalid_capacity_message unless load_capacity.between?(0..40000)
  end

end
