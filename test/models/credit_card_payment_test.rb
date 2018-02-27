require_relative '../fakes/buyer_fake'
require_relative '../fakes/card_fake'
require_relative '../fakes/client_fake'

class CreditCardPaymentTest < ActiveSupport::TestCase
  def setup 
    @buyer = BuyerFake.create
    @card = CardFake.create(@buyer)
    @client = ClientFake.create
    @payment = @buyer
      .credit_card_payments.create(amount: 1000, card_id: @card.id, client_id: @client.id)
  end

  test "credit card payment must be valid" do
    assert @payment.valid?
  end

  test "amount should be present" do
    @payment.amount = " "
    assert_not @payment.valid?
  end
end
