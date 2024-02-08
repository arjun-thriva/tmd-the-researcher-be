require 'net/http'
require 'uri'
require 'logger'

require 'json'

class OrderFetcher
  def initialize(client_id, client_secret)
    @logger = Logger.new(STDOUT)
    @auth_client = ThrivaAuthClient.new(client_id, client_secret)
  end

  def fetch_orders(start_date, end_date)
    access_token = @auth_client.generate_access_token
    @logger.info("HTTP #{access_token}")
    base_url = "https://api.euw2.development.thriva.io/v1/orders/"
    query_params = "?filter[startDate]=#{start_date}&filter[endDate]=#{end_date}"
    url = URI(base_url + query_params)

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer #{access_token}"
    request["Content-Type"] = "application/vnd.api+json"
    request["Accept"] = "application/vnd.api+json"

    
    response = https.request(request)

    @logger.info("HTTP Response Status: #{response.code} #{response.message}")
    @logger.debug("HTTP Response Body: #{response.body}")
  
    parsed_response = JSON.parse(response.read_body)
    order_ids = parsed_response["data"].map { |order| order["id"] }
    order_ids
  end
end
