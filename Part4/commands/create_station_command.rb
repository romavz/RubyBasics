require_relative './station'
require_relative 'command'

class CreateStationCommand < Command
    def execute
      puts "Введите название станции"
      station_name = gets.chomp
      if station_name != nil
        application.stations << Station.new(station_name)
      end
    end
end
