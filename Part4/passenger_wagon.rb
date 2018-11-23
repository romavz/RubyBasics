require_relative "passanger_wagon_class"

class PassengerWagon
  initialize(number, passenger_wagon_class = PassengerWagonClass.SECOND)
    Super(number)
    @wagon_class = passenger_wagon_class
  end
end
