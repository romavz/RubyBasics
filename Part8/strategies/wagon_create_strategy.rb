
class WagonCreateStrategy
  attr_reader :number

  def create_wagon
    print 'Введите номер вагона: '
    @number = gets.chomp
  end
end
