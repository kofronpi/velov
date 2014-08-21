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
        Geocoder::Calculations.distance_between([lat,lng], [station.lat,station.lng])
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

  end
end