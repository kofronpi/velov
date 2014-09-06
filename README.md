# Velov

Velov is a ruby wrapper for [Velov API](https://download.data.grandlyon.com/ws/smartdata/jcd_jcdecaux.jcdvelov.json) (Public Bike Sharing System of Lyon, France). This Wrapper allows you to play with objects like bike's stations !

[![Gem Version](https://badge.fury.io/rb/velov.svg)](http://badge.fury.io/rb/velov)
[![Build Status](https://travis-ci.org/pbechu/velov.svg?branch=v0.1.4)](https://travis-ci.org/pbechu/velov)
[![Coverage Status](https://img.shields.io/coveralls/pbechu/velov.svg)](https://coveralls.io/r/pbechu/velov?branch=master)
[![Code Climate](https://codeclimate.com/github/pbechu/velov/badges/gpa.svg)](https://codeclimate.com/github/pbechu/velov)
[![Dependency Status](https://gemnasium.com/pbechu/velov.svg)](https://gemnasium.com/pbechu/velov)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'velov'
```

And then execute:

```console
bundle install
```

Or install it yourself as:

```console
gem install velov
```

## Usage

### Start with the Velov API

Fetch data of all stations in one call:

```ruby
station_list = Velov::StationList.fetch
station_list.size # => 349
```

Navigate through the data with an Array of Station:

```ruby
stations = station_list.to_a

stations.each do |station|
    puts station.name
end
```

### Play with stations

Find a specific station with its internal ID:

```ruby
station = Velov::Station.find_by_number(10117)
station.status # => "OPEN"
```

Want more attributes ? Try one of these for a station:
- number (internal ID)
- name
- address
- address_complement
- city
- district_number
- [bonus](http://www.velov.grandlyon.com/FAQ-Question-Reponse.59+M55f945504e2.0.html)
- position (some indications to find the station)
- lat (latitude)
- lng (longitude)
- bike_stands (count of bike stands at this station)
- status ("OPEN" or "CLOSED")
- available_bike_stands (free slots)
- available_bikes ([ready to ride ?](http://www.annivelov.fr/))
- availability_code (internal usage)
- availability_label (internal usage)
- last_update (last time data were updated)

### Use the data

Get reports for a list of stations:

```ruby
station_list.bike_stands # => 6832
station_list.available_bike_stands # => 3534
station_list.available_bikes # => 3022
```

Discover if you can reach a specific station:

```ruby
station.distance_to(45.8,4.9) # => 2.48 (km)
```

Find the nearest stations around you:

```ruby
station_list.nearest(45.8,4.9)
```

Know the distance you will walk in a specified trip

```ruby
station_list.walking_distance([45.8,4.9],[46.1,4.8])
```

## Contributing

1. [Fork it](http://github.com/pbechu/velov/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
