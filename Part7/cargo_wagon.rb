require_relative 'wagon'

class CargoWagon < Wagon
  INVALID_CAPACITY_MESSAGE = 'Грузоподъемность выходит за допустимые пределы 1..40000'

  protected

  def max_capacity
    40000
  end

end
