require_relative '../cargo_wagon'

class WagonLoadCommand < WagonModifyCommand

  def do_execute(wagon)
    print 'Введите объем загрузки: '
    volume = gets.to_i
    wagon.take_a_space(volume)
  end

end
