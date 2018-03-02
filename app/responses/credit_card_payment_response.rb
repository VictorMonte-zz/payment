class CreditCardPaymentResponse

  attr_reader :type
  attr_reader :result
  attr_reader :payment_hash

  def initialize(result, payment_hash)
    @type = PaymentMethod::CREDITCARD
    @result = result
    @payment_hash = payment_hash
  end

  def as_json
    { :hash => @payment_hash }
  end
end
