class PaymentService

  def initialize
    @strategies = {}

    @strategies[PaymentMethod::CREDITCARD] = CreditCardPaymentService
    @strategies[PaymentMethod::BOLETO] = BoletoPaymentService
  end

  def register(payment, buyer_id, client_id)
      strategy = @strategies[payment[:type]]

      strategy.register(payment, buyer_id, client_id)
  end
end
