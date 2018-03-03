require_relative "../responses/status_payment_response"

class GetStatusPayment

  def initialize(payment_hash)
    @payment_hash = payment_hash
  end

  def call
    @payment = Payment.where(payment_hash: payment_hash).first

    if @payment.method == PaymentMethod::CREDITCARD
      @credit_card_payment = CreditCardPayment.where(payment_id: @payment.id).first
      @info = Card.find(@credit_card_payment.id)
    else
      @info = BoletoPayment.where(payment_id: @payment.id).first
    end

    StatusPaymentResponse.new(@payment, @info)
  end

  private

  attr_reader :payment_hash
end
