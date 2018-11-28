require_relative '../route'
require_relative 'command'

class ShowRoutesCommand < Command
  def execute
    application.routes.each_with_index { |route, index| puts "#{index}. #{route.name}" }
  end
end
