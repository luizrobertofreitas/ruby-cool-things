
module BankApp
  class Customer
    attr_accessor :id, :name

    def initialize(id = nil, name = nil)
      @id = id
      @name = name
    end
  end
end