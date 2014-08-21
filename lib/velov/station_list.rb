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

    def self.fetch

      response = API.get

      station_list = StationList.new(response.body["nb_results"])
      
      response.body["values"].each do |station_params|
        station_list.add_station(station_params)
      end

      station_list
    end

  end
end