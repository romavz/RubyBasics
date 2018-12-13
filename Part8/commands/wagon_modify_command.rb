require_relative 'command'

class WagonModifyCommand < Command
  WAGON_INDEX_OUT_OF_RANGE = 'Номер вагона за пределами списка'

  def execute
    train = application.selected_objects[:train]

    print 'Введите номер вагона по списку или \'0\' для выхода: '
    wagon_index = gets.to_i
    return if wagon_index == 0

    validate_wagon_index!(wagon_index, train)
    wagon = train.wagons[wagon_index - 1]

    do_execute(wagon)
    show_wagon_state(wagon)
  end

  protected

  def validate_wagon_index!(wagon_index, train)
    raise ArgumentError, WAGON_INDEX_OUT_OF_RANGE unless wagon_index.between?(1, train.wagons.count)
    true
  end

  def show_wagon_state(wagon)
    puts "#{wagon.properties}"
  end
end
