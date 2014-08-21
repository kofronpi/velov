require "spec_helper"

describe Velov::Station do
  describe ":fetch" do
    before(:each) do
      VCR.use_cassette "fetch_valid_station_by_number" do
        @station = Velov::Station.fetch(10117)
      end
    end

    it { expect(@station.number).to eq 10117}
  end 
end