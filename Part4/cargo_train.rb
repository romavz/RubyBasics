require_relative 'train'

#  Грузовой поезд
class CargoTrain < Train
  def create_wagon
    print 'Введите номер вагона: '
    number = gets.chomp.to_i
    print 'Введите грузоподъемность: '
    load_capacity = gets.chomp.to_i
    wagon = CargoWagon.new(number, load_capacity)
    wagon
  end

  protected

  def allowed_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end

  def type
    'Грузовой'
  end
end
