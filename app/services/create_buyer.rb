class CreateBuyer
  def initialize(buyer)
    @buyer = buyer
  end

  def call
    Buyer.create(@buyer)
  end

  def get
    Buyer.where(cpf: @buyer).first
  end
end
