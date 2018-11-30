require_relative 'instance_counter'

class Station
  attr_reader :name, :trains
  #наследников тоже будем добавлять в коллекцию

  include InstanceCounter

  def initialize(name)
    @name = name
    @trains = []
    register_instance
  end

  def arrive_train(train)
    @trains << train unless @trains.include?(train)
  end

  def get_trains_by_type(train_type)
    trains.select { |train| train.type == train_type }
  end

  def depart_train(train)
    trains.delete(train)
  end
end
