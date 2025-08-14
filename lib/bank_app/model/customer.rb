module BankApp
  class Customer
    attr_accessor :id, :name

    def initialize(name = nil)
      @name = name
    end
  end
end