require_relative 'train'

#  Грузовой поезд
class CargoTrain < Train
  protected
  def is_allowed(wagon)
    wagon.is_a?(CargoWagon)
end
