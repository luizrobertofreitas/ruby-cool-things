require 'rspec'
require 'bank_app/operations/get_balance_usecase'

RSpec.configure do |config|
  
end

RSpec.describe "BankApp::GetBalanceUseCase", '#invoke' do
  
  let(:get_balance_usecase) { BankApp::GetBalanceUseCase.new }
  
  context 'when passing a valid account_id' do
    it "then should return the balance" do
      account = get_balance_usecase.invoke(1)
      expect(account.balance).to eq(1000.0)
    end
  end

  context 'when passing an invalid account_id' do
    it 'then should raise an error' do
      expect {
        get_balance_usecase.invoke(nil)
      }.to raise_error('Account Id cannot be nil')
    end
  end
end
