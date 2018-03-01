class BuyerService
  def initialize(buyer)
    @buyer = buyer
  end

  def create
    Buyer.create(@buyer)
  end
end
