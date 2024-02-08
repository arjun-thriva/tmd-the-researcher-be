require 'sinatra'
require './services/order_fetcher'
require './services/thriva_auth_client'
get '/' do
  'Hello world!'
end

client_id = ENV['THRIVA_AUTH0_CLIENT_ID']
client_secret = ENV['THRIVA_AUTH0_CLIENT_SECRET']

ORDER_FETCHER = OrderFetcher.new(client_id, client_secret)

get '/fetch_orders' do
  # Example start and end dates
  start_date = "2022-12-30"
  end_date = "2023-01-12"

  # Fetch the orders
  order_ids = ORDER_FETCHER.fetch_orders(start_date, end_date)

  # Respond with the order IDs in JSON format
  content_type :json
  { order_ids: order_ids }.to_json
end
