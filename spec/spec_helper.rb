require 'bundler/setup'
require 'webmock/rspec'
require 'vcr'
require 'coveralls'
require 'open-uri'
Coveralls.wear!

require_relative '../lib/velov.rb'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end

