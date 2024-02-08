require 'sinatra'

get 'participants/:participant-id/summary' do
  include_results = params['results']

end
