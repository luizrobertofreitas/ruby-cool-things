require "pg"
require "logger"

module Config
  class PostgresDB
    attr_accessor :client

    ## Connection string samples
    # postgresql://
    # postgresql://localhost
    # postgresql://localhost:5432
    # postgresql://localhost/mydb
    # postgresql://user@localhost
    # postgresql://user:secret@localhost
    # postgresql://other@localhost/otherdb?connect_timeout=10&application_name=myapp
    # postgresql://localhost/mydb?user=other&password=secret
    def initialize(connection_string)
      @log = Logger.new(STDOUT)
      @connection_string = connection_string

      ping = PG::Connection.ping(@connection_string)
      if ping != PG::Constants::PQPING_OK
        error_msg = "Connection Error #{ping}"
        @log.error(error_msg)
        raise error_msg
      end
      @log.info("Connected to database #{ping}")
    end

    def create_connection
      PG::Connection.open(@connection_string)
    end
  end
end