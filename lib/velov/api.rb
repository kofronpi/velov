module Velov
  class API
    # DRY API Calls
    def self.get(params = {})
      connection ||= Faraday.new 'https://download.data.grandlyon.com' do |conn|
        conn.response :json, :content_type => /\bjson$/
        conn.adapter Faraday.default_adapter
      end
      connection.get "/ws/smartdata/jcd_jcdecaux.jcdvelov/all.json", params
    end
  end
end