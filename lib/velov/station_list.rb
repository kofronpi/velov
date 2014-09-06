module Velov
  class StationList
    include Virtus.model

    attribute :size, Integer
    attribute :list, Array[Station]
    
    def initialize(size)
      @size = size
      @list = []
    end

    def add_station(params)
      @list << Station.new(params)
    end

    def to_a
      @list
    end

    # Fetch data of all stations
    def self.fetch(params = {})

      response = API.get(params)

      station_list = StationList.new(response.body["nb_results"])
      
      response.body["values"].each do |station_params|
        station_list.add_station(station_params)
      end

      station_list
    end

    def nearest(lat,lng)
      @list.sort_by do |station|
        station.distance_to(lat,lng)
      end
    end

    def bike_stands
      @list.map(&:bike_stands).inject(:+)
    end

    def available_bike_stands
      @list.map(&:available_bike_stands).inject(:+)
    end

    def available_bikes
      @list.map(&:available_bikes).inject(:+)
    end

    def walking_distance(start, arrival)
      start_station = self.nearest(start.first, start.last).find do |station|
        station.status == "OPEN" and station.available_bikes > 0
      end
      arrival_station = self.nearest(arrival.first, arrival.last).find do |station|
        station.status == "OPEN" and station.available_bike_stands > 0
      end
      start_station.distance_to(start.first, start.last) + arrival_station.distance_to(arrival.first, arrival.last)
    end

  end
end