module BankApp
  class Account
    attr_accessor :id, :customer_id, :balance
    
    def initialize(customer_id = nil, balance = 0)
      @customer_id = customer_id
      @balance = balance
    end

    def self.get_balance(account_id)
      raise 'Account Id cannot be nil' if account_id == nil
      Account.new(1, 1000.0)
    end
  end
end