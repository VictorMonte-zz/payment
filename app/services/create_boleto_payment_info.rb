require_relative "../responses/boleto_payment_response"
require "create_boleto_number"

class CreateBoletoPaymentInfo
  def initialize(payment)
    @payment = payment
  end

  def call
    @boleto_number = create_boleto_number.call
    @boleto_payment =  BoletoPayment.create(payment_id: @payment.id, boleto_number: @boleto_number)
    BoletoPaymentResponse.new(@boleto_payment, @payment.payment_hash)
  end

  private

  def create_boleto_number
    create_boleto_number ||= CreateBoletoNumber.new
  end
end
