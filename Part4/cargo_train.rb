require_relative 'train'

#  Грузовой поезд
class CargoTrain < Train

  protected

  def allowed_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end

  def type
    'Грузовой'
  end

  def create_wagon
    print 'Введите номер вагона: '
    number = gets.chomp.to_i
    print 'Введите грузоподъемность: '
    load_capacity = gets.chomp.to_i
    wagon = CargoWagon.new(number, load_capacity)
  end

end
