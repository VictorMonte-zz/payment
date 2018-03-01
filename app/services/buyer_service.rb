class BuyerService
  def initialize(buyer)
    @buyer = buyer
  end

  def create
    Buyer.create(@buyer)
  end

  def get
    Buyer.where(cpf: @buyer).first
  end
end
