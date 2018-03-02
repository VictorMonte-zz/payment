require_relative '../responses/credit_card_payment_response'

class CreateCreditCardPaymentInfo
  def initialize(payment, card_id)
    @payment = payment
    @card_id = card_id
  end

  def call
    @credit_payment = CreditCardPayment.create(payment_id: @payment.id, card_id: @card_id)
    CreditCardPaymentResponse.new(@credit_payment, @payment.payment_hash)
  end
end
