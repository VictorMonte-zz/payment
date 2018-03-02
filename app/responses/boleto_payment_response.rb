require_relative '../enums/payment_method'

class BoletoPaymentResponse

  attr_reader :type
  attr_reader :result
  attr_reader :payment_hash

  def initialize(result, payment_hash)
    @type = PaymentMethod::BOLETO
    @result = result
    @payment_hash = payment_hash
  end

  def as_json
    { :hash => @payment_hash, :boleto => @result.boleto_number }
  end

end
