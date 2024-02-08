class ThrivaClient
  def initialize(auth0_client)
    @auth0_client = auth0_client
  end

  def get_order(order_reference_id)
    url = URI("https://api.euw2.development.thriva.io/v1/orders/#{order_reference_id}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Accept"] = "application/vnd.api+json"
    request["Content-Type"] = "application/vnd.api+json"
    request["Authorization"] = "Bearer #{@auth0_client.generate_access_token}"
  end

  def get_order_tests(order_reference_id)
    url = URI("https://api.euw2.development.thriva.io/v1/orders/#{order_reference_id}/tests")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Accept"] = "application/vnd.api+json"
    request["Content-Type"] = "application/vnd.api+json"
    request["Authorization"] = "Bearer #{@auth0_client.generate_access_token}"
  end

  def get test_result_set(result_set_reference_id)
    url = URI("https://api.euw2.development.thriva.io/v1/result-sets/#{result_set_reference_id}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Accept"] = "application/vnd.api+json"
    request["Content-Type"] = "application/vnd.api+json"
    request["Authorization"] = "Bearer #{@auth0_client.generate_access_token}"
  end
end
