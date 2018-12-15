require_relative '../cargo_wagon'
require_relative 'wagon_create_strategy'

class CargoWagonCreateStrategy < WagonCreateStrategy
  def create_wagon
    super
    print 'Введите грузоподъемность: '
    load_capacity = gets.to_i
    wagon = CargoWagon.new(number, load_capacity)
    wagon
  end
end
