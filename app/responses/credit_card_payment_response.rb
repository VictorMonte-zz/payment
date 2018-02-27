class CreditCardPaymentResponse

  attr_reader :type
  attr_reader :result

  def initialize(result)
    @type = PaymentMethod::CREDITCARD
    @result = result
  end
end
