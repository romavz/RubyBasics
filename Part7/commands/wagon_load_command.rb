require_relative '../cargo_wagon'

class WagonLoadCommand < WagonModifyCommand

  def do_execute(wagon)
    print 'Введите объем загрузки: '
    volume = gets.to_i
    wagon.fill_volume(volume)
  end

end
