module RubyBasicsPart3

  class Station
  
    attr_reader :name
    attr_reader :trains

    def initialize(name)
      @name = name
      @trains = []
    end

    def arrive_train(train)
      @trains << train if !@trains.include?(train)
    end

    def get_trais
      [].replace(trains)
    end

    def get_trains_by_type(train_type)
      trains.select do |train|
        train.type == train_type
      end
    end

    def depart_train(train)
      trains.delete(train)
    end
  end

end