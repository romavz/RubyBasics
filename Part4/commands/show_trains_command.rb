require_relative '../train'
require_relative 'command'

class ShowTrainsCommand < Command
  def execute
    trains = application.trains
    trains.each_with_index {
      |train, index| puts " #{index + 1}.  №#{train.number} - #{train.name} (#{train.type})" }
  end
end
