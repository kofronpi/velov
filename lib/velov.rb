require 'virtus'
require 'faraday'
require 'faraday_middleware'
require 'geocoder'
require "velov/version"
require "velov/api"
require "velov/station"
require "velov/station_list"
module Velov
  # Define API Constants
  NUMBER = 0
  NAME = 1
  ADDRESS = 2
  ADDRESS_COMPLEMENT = 3
  CITY = 4
  DISTRICT_NUMBER = 5
  LATITUDE = 8
  LONGITUDE = 9
  BIKE_STANDS = 10
  STATUS = 11
  AVAILABLE_BIKE_STANDS = 12
  AVAILABLE_BIKES = 13
  LAST_UPDATE = 18
end
