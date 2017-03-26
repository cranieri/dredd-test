require 'sinatra'
require 'net/http'
require 'json'
require 'webmock'
class MyApp < Sinatra::Base
  include WebMock::API

  before do
    headers "Content-Type" => "application/json"
    if (settings.environment == :test)
      WebMock.enable!
      stub_request(:any, "stackoverflow.com").to_return(body: "byee")
    end
  end

  get '/reporting/reports/end_of_day_balances' do
    # p Net::HTTP.get('stackoverflow.com', '/')
    response.headers['Content-Type'] = "application/json"
    { res: 'Hello world!' }.to_json
  end
end
