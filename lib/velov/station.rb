module Velov
  class Station
    include Virtus.model

    attribute :number, Integer
    attribute :name, String
    attribute :address, String
    attribute :address_complement, String
    attribute :city, String
    attribute :district_number, Integer
    attribute :lat, Float
    attribute :lng, Float
    attribute :bike_stands, Integer
    attribute :status, String
    attribute :available_bike_stands, Integer
    attribute :available_bikes, Integer
    attribute :last_update, DateTime

    def initialize(params)
      @number = params[Velov::NUMBER].to_i
      @name = params[Velov::NAME]
      @address = params[Velov::ADDRESS]
      @address_complement = params[Velov::ADDRESS_COMPLEMENT]
      @city = params[Velov::CITY]
      @district_number = params[Velov::DISTRICT_NUMBER].to_i
      @lat = params[Velov::LATITUDE].to_f
      @lng = params[Velov::LONGITUDE].to_f
      @bike_stands = params[Velov::BIKE_STANDS].to_i
      @status = params[Velov::STATUS]
      @available_bike_stands = params[Velov::AVAILABLE_BIKE_STANDS].to_i
      @available_bikes = params[Velov::AVAILABLE_BIKES].to_i
      @last_update = DateTime.parse(params[Velov::LAST_UPDATE])
    end

    def self.find_by_number(number)
      # nil if not found
      StationList.fetch({ "field" => "number", "value" => number}).to_a.first
    end
  end
end