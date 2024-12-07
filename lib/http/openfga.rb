require 'json'
require 'httparty'

class OpenFGA
  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def create_store(name)
    JSON.parse(
      HTTParty.post(
        "#{@url}/stores",
        body: JSON.generate({name: name}), headers: { 'Content-Type' => 'application/json' }, format: :plain
      ),
      symbolyze_names: true
    )
  end

  def delete_store(id)
    HTTParty.delete("#{@url}/stores/#{s['id']}")
  end

  def get_all_stores
    JSON.parse(
      HTTParty.get("#{@url}/stores", format: :plain), symbolyze_names: true
    )
  end

  def delete_all_stores
    get_all_stores['stores'].each do |s|
      res = HTTParty.delete("#{@url}/stores/#{s['id']}")
    end
  end
end