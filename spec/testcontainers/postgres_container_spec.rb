require 'rspec'
require 'testcontainers/postgres'
require 'config/postgres_db'

RSpec.configure do |config|
  config.add_setting :postgres_container, default: nil
  
  config.before(:suite) do
    config.postgres_container = Testcontainers::PostgresContainer.new
    config.postgres_container.start
  end

  config.after(:suite) do
    config.postgres_container&.stop if config.postgres_container&.running?
    config.postgres_container&.remove
  end
end

RSpec.describe "Postgres" do
  context 'when pinging' do
    it 'responds successfully' do
      Config::PostgresDB.new(RSpec.configuration.postgres_container.database_url)
    end
  end
end
