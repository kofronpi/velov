module Velov
  # A Velo'v station
  class Station
    include Virtus.model

    attribute :number, Integer
    attribute :name, String
    attribute :address, String
    attribute :address_complement, String
    attribute :city, String
    attribute :district_number, Integer
    attribute :bonus, Boolean
    attribute :position, String
    attribute :lat, Float
    attribute :lng, Float
    attribute :bike_stands, Integer
    attribute :status, String
    attribute :available_bike_stands, Integer
    attribute :available_bikes, Integer
    attribute :availability_code, Integer
    attribute :availability_label, String
    attribute :last_update, DateTime

    def initialize(params)
      @number = params[Velov::NUMBER].to_i
      @name = params[Velov::NAME]
      @address = params[Velov::ADDRESS]
      @address_complement = params[Velov::ADDRESS_COMPLEMENT]
      @city = params[Velov::CITY]
      @district_number = params[Velov::DISTRICT_NUMBER].to_i
      @bonus = params[Velov::BONUS] == 'Oui'
      @position = params[Velov::POSITION]
      @lat = params[Velov::LATITUDE].to_f
      @lng = params[Velov::LONGITUDE].to_f
      @bike_stands = params[Velov::BIKE_STANDS].to_i
      @status = params[Velov::STATUS]
      @available_bike_stands = params[Velov::AVAILABLE_BIKE_STANDS].to_i
      @available_bikes = params[Velov::AVAILABLE_BIKES].to_i
      @availability_code = params[Velov::AVAILABILITY_CODE].to_i
      @availability_label = params[Velov::AVAILABILITY_LABEL]
      @last_update = DateTime.parse(params[Velov::LAST_UPDATE])
    end

    # Find a bike Station.
    #
    # @param [Integer] station number
    # @return [Station] Station object, nil if not found
    def self.find_by_number(number)
      StationList.fetch('field' => 'number', 'value' => number).to_a.first
    end

    def distance_to(lat, lng)
      Geocoder::Calculations.distance_between([@lat, @lng], [lat, lng],
                                              units: :km)
    end
  end
end
