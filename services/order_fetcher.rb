require 'net/http'
require 'uri'
require 'json'

class OrderFetcher
  def initialize(client_id, client_secret)
    @auth_client = ThrivaAuthClient.new(client_id, client_secret)
  end

  def fetch_orders(start_date, end_date)
    access_token = @auth_client.generate_access_token
    base_url = "https://api.euw2.development.thriva.io/v1/orders/"
    query_params = "?filter[startDate]=#{start_date}&filter[endDate]=#{end_date}"
    url = URI(base_url + query_params)

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer #{access_token}"
    request["Content-Type"] = "application/json"

    response = https.request(request)
    JSON.parse(response.read_body)
  end
end
