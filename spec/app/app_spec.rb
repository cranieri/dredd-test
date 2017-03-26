require "spec_helper"

require 'yaml'
endpoints = []

api_spec = YAML.load_file('spec/app/swagger.yml')
api_spec["paths"].keys.each do |p|
  api_spec['paths'][p].keys.each do |v|
    api_spec['paths'][p][v]['parameters'].each do |par|
      p par
      endpoints << { verb: v, url: p, params: par['name'] }
    end
  end
  p "-------------"
end

p endpoints

describe MyApp do
  context "/reporting/end_of_day_balances" do
    before do
      def app() MyApp end

      stub_request(:any, "stackoverflow.com").
        to_return(body: "bye")
    end

    # endpoints[1].each do |endpoint|
      it "returns 200" do
        get "/reporting/end_of_day_balances", {"date" => "hi"}
        p last_response
        expect(last_response.status).to be 200
      end
    # end
  end
end
