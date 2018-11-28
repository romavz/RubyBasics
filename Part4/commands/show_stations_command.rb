require_relative '../station'
require_relative 'command'

class ShowStationsCommand < Command
  def execute
    application.stations.each { |station| puts "  #{station.name}" }
  end
end
