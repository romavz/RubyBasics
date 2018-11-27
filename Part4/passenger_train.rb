require_relative 'train'

# Пассажирский поезд
class PassengerTrain < Train

  protected

  def allowed_wagon?(wagon)
    wagon.is_a?(PassengerWagon)
  end

  def type
    'Пассажирский'
  end

  def create_wagon
    print "Введите номер вагона: "
    number = gets.chomp!.to_i
    print "Введите количество мест: "
    seat_count = gets.chomp!.to_i
    wagon = PassengerWagon.new(number, seat_count)
  end

end
