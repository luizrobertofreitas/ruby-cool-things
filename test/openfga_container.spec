require 'rspec'
require 'json'
require 'httparty'

RSpec.describe "OpenFGA API", '#stores' do

  let(:openfga_url) { "http://localhost:8080" }

  describe '#stores' do
    let(:store_name) {"FGA Demo Store"}
    let(:response) {
      JSON.parse(
        HTTParty.post(
          "#{openfga_url}/stores",
          body: JSON.generate({name: store_name}), headers: { 'Content-Type' => 'application/json' }, format: :plain
        ),
        symbolyze_names: true
      )
    }
    context 'when creating an store' do
      

      it "should have a valid id" do
        expect(response['id']).not_to be_empty
      end

      it "should match the name" do
        expect(response['name']).to eq store_name
      end
    end
  end
end