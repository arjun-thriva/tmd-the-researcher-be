require 'net/http'

class ThrivaAuthClient
  def initialize(client_id, client_secret)
    @client_id = client_id
    @client_secret = client_secret
  end

  def generate_access_token
    url = URI("https://auth.development.thriva.io/oauth/token")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/x-www-form-urlencoded"
    request.body = "grant_type=client_credentials&client_id=#{@client_id}}&client_secret=#{@client_secret}&audience=https%3A%2F%2Fapi.euw2.development.thriva.io"

    response = https.request(request)
    response.read_body["access_token"]
  end

end



require "uri"
require "net/http"

