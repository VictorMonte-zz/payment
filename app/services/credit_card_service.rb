class CreditCardService
  def initialize(card)
    @card = card
  end

  def create(cpf)
    @buyer =  BuyerService.new(cpf).get
    byebug
    @buyer.cards.create(@card)
  end
end
