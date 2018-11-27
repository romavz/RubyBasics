
class Wagon
  attr_reader :properties

  def initialize(number)
    @number = number
    @properties = { 'номер'.freeze => @number }
  end

end
