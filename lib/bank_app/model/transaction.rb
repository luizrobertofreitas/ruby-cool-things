module BankApp
  class Transaction
    attr_accessor :id, :transaction_id, :account_id, :amount, :created_at

    def initialize(transaction_id = nil, account_id = nil, amount = nil)
      @transaction_id = transaction_id
      @account_id = account_id
      @amount = amount
    end
  end
end