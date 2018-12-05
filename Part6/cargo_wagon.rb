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
    message = "Грузоподъемность выходит за допустимые пределы 0..40000"
    raise ArgumentError, message unless (0..40000).include?(load_capacity)
  end

end
