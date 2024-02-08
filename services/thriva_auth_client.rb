require 'net/http'
require 'logger'
require "uri"

class ThrivaAuthClient
  def initialize(client_id, client_secret)
    @client_id = "WQ8qoSvjrMULhJYUZGjTvXMM5o5t2608"
    @client_secret = "1pJ9mz2JvbeZ4yUHn7QIwyi6MNiNYxlyw5gH5nANLP8RGe1xA5EQGuAQO5B-T5c1"
    @logger = Logger.new(STDOUT)
  end

  # def generate_access_token
  #   url = URI("https://auth.development.thriva.io/oauth/token")

  #   https = Net::HTTP.new(url.host, url.port)
  #   https.use_ssl = true

  #   request = Net::HTTP::Post.new(url)
  #   request["Content-Type"] = "application/x-www-form-urlencoded"
  #   request.body = "grant_type=client_credentials&client_id=#{@client_id}}&client_secret=#{@client_secret}&audience=https://api.euw2.development.thriva.io
  #   "

  #   response = https.request(request)
  #   @logger.info("client id: #{@client_id}")
  #   @logger.info("secret: #{@client_secret}")

  #   @logger.info("auth client response: #{response}")
  #   response.read_body["access_token"]
  # end

  def generate_access_token
    url = URI("https://auth.development.thriva.io/oauth/token")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/x-www-form-urlencoded"
    request["Cookie"] = "__cf_bm=i23HDbuVvsa.v_EpdODPKG3L5L6NviOuFG_8aEE7lkA-1707406308-1-AXlUbDxYJIDfE8RwJhkrP0dLvCKUPoXjusLqduB4iGR/6jo1YJ2o4LWikepkxloLtw==; did=s%3Av0%3A6297be90-b09d-11ee-87d2-6bd6ad1c4a39.ViREorxkyhzLbakXBgcul6OG6O7sei6l6ICuwiFbhUs; did_compat=s%3Av0%3A6297be90-b09d-11ee-87d2-6bd6ad1c4a39.ViREorxkyhzLbakXBgcul6OG6O7sei6l6ICuwiFbhUs"
    request.body = "grant_type=client_credentials&client_id=WQ8qoSvjrMULhJYUZGjTvXMM5o5t2608&client_secret=1pJ9mz2JvbeZ4yUHn7QIwyi6MNiNYxlyw5gH5nANLP8RGe1xA5EQGuAQO5B-T5c1&audience=https%3A%2F%2Fapi.euw2.development.thriva.io"

    @logger.info("client id: #{@client_id}")
    @logger.info("secret: #{@client_secret}")

    response = https.request(request)

    # Parse the response string as JSON
    response_hash = JSON.parse(response.body)

    # Extract the access token
    access_token = response_hash['access_token']
    access_token
  end
end



require "uri"
require "net/http"

