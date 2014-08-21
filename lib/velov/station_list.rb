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

  end
end