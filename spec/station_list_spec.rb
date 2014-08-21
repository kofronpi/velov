require "spec_helper"

describe Velov::StationList do
  describe ":fetch" do
    before(:each) do
      VCR.use_cassette "fetch_valid_station_list" do
        @station_list = Velov::StationList.fetch
      end
    end
    it { expect(@station_list.size).to eq 349 }
    it { expect(@station_list.to_a.length).to eq 349}
  end
end