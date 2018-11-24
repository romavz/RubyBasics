require_relative "passanger_wagon_class"

class PassengerWagon

  def initialize(number, passenger_wagon_class = PassengerWagonClass.SECOND)
    super(number)
    @wagon_class = passenger_wagon_class
  end
end
