require 'rspec'
require 'http/openfga'

RSpec.configure do |config|
  config.add_setting :openfga, default: OpenFGA.new('http://localhost:8080')
end

RSpec.describe "OpenFGA API", '#stores' do

  before(:context) {
    @store_response = RSpec.configuration.openfga.create_store('Default')
  }

  context 'when creating an store' do
    it "should have a valid id" do
      expect(@store_response['id']).not_to be_empty
    end

    it "should match the name" do
      expect(@store_response['name']).to eq 'Default'
    end
  end

  after(:context) {
    RSpec.configuration.openfga.delete_all_stores
  }
end
