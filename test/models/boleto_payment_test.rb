require_relative '../fakes/buyer_fake'
require_relative '../fakes/card_fake'
require_relative '../fakes/client_fake'

class BoletoPaymentTest < ActiveSupport::TestCase
  def setup 
    @buyer = BuyerFake.create
    @card = CardFake.create(@buyer)
    @client = ClientFake.create
    @payment = @buyer
      .boleto_payments
      .create(amount: 1000, boleto_number: "123412341234", client_id: @client.id)
  end

  test "boleto payment must be valid" do
    assert @payment.valid?
  end

  test "amount should be present" do
    @payment.amount = " "
    assert_not @payment.valid?
  end

  test "boleto number should be present" do
    @payment.boleto_number = " "
    assert_not @payment.valid?
  end
end
