# Velov

Velov is a ruby wrapper for [Velov API](https://download.data.grandlyon.com/ws/smartdata/jcd_jcdecaux.jcdvelov.json) (Public Bike Sharing System of Lyon, France). This Wrapper allows you to play with objects like bike's stations ! It's possible to add more features in the future, like "nearest station around me".

[![Gem Version](https://badge.fury.io/rb/velov.svg)](http://badge.fury.io/rb/velov)
[![Build Status](https://travis-ci.org/pbechu/velov.svg?branch=v0.1.4)](https://travis-ci.org/pbechu/velov)
[![Coverage Status](https://img.shields.io/coveralls/pbechu/velov.svg)](https://coveralls.io/r/pbechu/velov?branch=master)
[![Code Climate](https://codeclimate.com/github/pbechu/velov/badges/gpa.svg)](https://codeclimate.com/github/pbechu/velov)
[![Dependency Status](https://gemnasium.com/pbechu/velov.svg)](https://gemnasium.com/pbechu/velov)

## Installation

Add this line to your application's Gemfile:

    gem 'velov'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install velov

## Usage

### Retrieve all stations
You can fetch data of all stations in one call:
    
    station_list = Velov::StationList.fetch    

Use an array to navigate through the data:
    
    total_available_bikes = station_list.to_a.map(&:available_bikes).inject(:+)

### Play with one station
You can find a specific station with its ID:

    station = Velov::Station.find_by_number(10117)
    station.lat
    station.lng

## Contributing

1. Fork it ( http://github.com/pbechu/velov/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
