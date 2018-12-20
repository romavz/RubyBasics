require_relative 'train'

#  Грузовой поезд
class CargoTrain < Train
  def type
    'Грузовой'
  end

  protected

  def allowed_wagon?(wagon)
    wagon.is_a?(CargoWagon) && super
  end
end
