module RubyBasicsPart3

  class Route

    def initialize (first_station, last_station)
      @stations = [first_station, last_station]
    end

    def first_station
      @stations[0]
    end

    def last_station
      @stations[-1]
    end

    # Добавляет станцию в конец списка перед конечной станцией
    def add_station(station)
      @stations.insert(-2, station)
    end

    # Добавляет станцию в список за указанной
    def add_station_after(prev_station, station)
      prev_index = @stations.index(prev_station + 1)
      @stations.insert(prev_index, station)
    end

    def remove(station)
      @stations.delete do |a_station|
        (a_station != first_station) && (a_station != last_station)
      end
    end

    def get_station_after(station)
      raise "Не задан пункт назначения" if station == nil
      return nil if station == last_station
      station_index = get_station_index(station)
      @stations[station_index + 1] if (station_index < (@stations.count - 1))
    end

    def get_station_before(station)
      raise "Не задан пункт назначения" if station == nil
      return nil if station == first_station
      station_index = get_station_index(station)
      @stations[station_index - 1]
    end

    def stations
      [].replace @stations
    end

    private
      def get_station_index(station)
        @stations.index(station)
      end

  end
end