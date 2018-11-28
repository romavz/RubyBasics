class Route
  attr_reader :stations
  attr_reader :name

  def initialize(name, first_station, last_station)
    @name = name
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

  def remove_station(station)
    return if station == first_station || station == last_station

    @stations.delete(station)
  end

  def stations_count
    @stations.count
  end
end
