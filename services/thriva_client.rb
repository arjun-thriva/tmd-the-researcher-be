class ThrivaClient
  def initialize(auth0_client)
    @auth0_client = auth0_client
  end
  def get_order(reference_id)
    url = URI("https://api.euw2.development.thriva.io/v1/orders/#{reference_id}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Accept"] = "application/vnd.api+json"
    request["Content-Type"] = "application/vnd.api+json"
    request["Authorization"] = "Bearer #{@auth0_client.generate_access_token}"
  end

  def
end
