module Velov
  class API
    API_HOST = 'https://download.data.grandlyon.com'
    API_ENDPOINT = "/ws/smartdata/jcd_jcdecaux.jcdvelov/all.json"
    # DRY API Calls
    def self.get(params = {})
      connection ||= Faraday.new API_HOST do |conn|
        conn.response :json, :content_type => /\bjson$/
        conn.adapter Faraday.default_adapter
      end
      connection.get API_ENDPOINT, params
    end
  end
end