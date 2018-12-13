require_relative '../passenger_wagon'
require_relative 'wagon_modify_command'

class WagonTakeASeatCommand < WagonModifyCommand

  def do_execute(wagon)
    wagon.take_a_space(1)
  end

end
