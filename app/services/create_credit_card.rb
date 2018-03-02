class CreateCreditCard
  def initialize(card, cpf)
    @card = card
    @cpf = cpf
  end

  def call
    @buyer = get_buyer_by_cpf.call
    @buyer.cards.create(card)
  end

  private

  attr_reader :cpf
  attr_reader :card

  def get_buyer_by_cpf
    get_buyer_by_cpf ||= GetBuyerByCpf.new(cpf)
  end
end
