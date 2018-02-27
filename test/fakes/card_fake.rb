class CardFake
  def self.create(buyer)
    @card = buyer.cards.create(
      holder_name: "asas", 
      number: "1234123412341234",
      expiration_date: Date.parse("2019-02-02"), 
      cvv: 123)

  end
end
