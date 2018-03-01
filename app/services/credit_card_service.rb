class CreditCardService
  def initialize(card)
    @card = card
  end

  def create(cpf)
    @buyer =  BuyerService.new(cpf).get
    @buyer.cards.create(@card)
  end
end
