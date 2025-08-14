require 'bank_app/model/account'

module BankApp
  class GetBalanceUseCase
    def invoke(account_id)
      Account.get_balance(account_id)
    end
  end
end