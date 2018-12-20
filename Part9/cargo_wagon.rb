require_relative 'wagon'

class CargoWagon < Wagon
  INVALID_CAPACITY_MESSAGE = 'Грузоподъемность выходит за допустимые пределы 1..40000'.freeze

  protected

  def max_capacity
    40_000
  end
end
