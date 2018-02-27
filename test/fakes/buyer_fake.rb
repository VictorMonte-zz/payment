class BuyerFake
  def self.create
    Buyer.create(name: "Bruce", email: "bruce@wayne.com", cpf: "34221475811")
  end
end
