module Velov
  class Station
    include Virtus.model

    attribute :number, Integer
    attribute :name, String
    attribute :available_bikes, Integer

    def initialize(params)
      @number = params[0].to_i
      @name = params[1]
      @available_bikes = params[13].to_i
    end

    def self.fetch(number)
      response = API.get({ "field" => "number", "value" => number})
      Station.new(response.body["values"].first)
    end
  end
end