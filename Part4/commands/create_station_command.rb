require_relative '../station'
require_relative 'command'

class CreateStationCommand < Command
  def execute
    puts 'Введите название станции'
    station_name = gets.chomp
    application.stations << Station.new(station_name) unless station_name.nil?
  end
end
