require "spec_helper"

describe Velov::Station do
  describe ":find_by_number" do
    context 'valid number' do
      before(:each) do
        VCR.use_cassette "find_valid_station_by_number" do
          @station = Velov::Station.find_by_number(10117)
        end
      end

      it { expect(@station.number).to eq 10117}
      it { expect(@station.name).to eq "La Pérralière"}
      it { expect(@station.address).to eq "171 rue Léon Blum"}
      it { expect(@station.address_complement).to eq "None"}
      it { expect(@station.city).to eq "VILLEURBANNE"}
      it { expect(@station.district_number).to eq 117}
      it { expect(@station.lat).to eq 45.7645636665294000}
      it { expect(@station.lng).to eq 4.8923336071821100}
      it { expect(@station.bike_stands).to eq 22}
      it { expect(@station.status).to eq "OPEN"}
      it { expect(@station.available_bike_stands).to eq 12}
      it { expect(@station.available_bikes).to eq 10}
      it { expect(@station.last_update).to eq DateTime.new(2014,8,21,14,50,31) }
      
    end

    context 'invalid number' do
      before(:each) do
        VCR.use_cassette "find_invalid_station_by_number" do
          @station = Velov::Station.find_by_number(101173456)
        end
      end

      it { expect(@station).to be nil}
    end
  end

  describe ':distance_to' do
    before(:each) do
      VCR.use_cassette "find_valid_station_by_number" do
        @station = Velov::Station.find_by_number(10117)
      end
    end

    it { expect(@station.distance_to(45.8,4.9)).to eq 2.4761240501617032 }
  end
end