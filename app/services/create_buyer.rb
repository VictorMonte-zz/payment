class CreateBuyer
  def initialize(buyer)
    @buyer = buyer
  end

  def call
    Buyer.create(@buyer)
  end

end
