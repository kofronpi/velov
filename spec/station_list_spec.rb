require "spec_helper"

describe Velov::StationList do
  before(:each) do
    VCR.use_cassette "fetch_valid_station_list" do
      @station_list = Velov::StationList.fetch
    end
  end
  describe ":fetch" do
    
    it { expect(@station_list.size).to eq 349 }
    it { expect(@station_list.to_a.length).to eq 349}
  end

  describe ":nearest" do
    it { expect(@station_list.nearest(45.7645636665294000,4.8923336071821100).first.number).to eq 10117 }
  end

  describe "sums" do
    it { expect(@station_list.bike_stands).to eq 6832}
    it { expect(@station_list.available_bike_stands).to eq 3544}
    it { expect(@station_list.available_bikes).to eq 3031}
  end
end