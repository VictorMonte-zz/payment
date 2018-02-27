require_relative '../enums/payment_method'

class BoletoPaymentResponse
  
   attr_reader :type
   attr_reader :result

  def initialize(result)
    @type = PaymentMethod::BOLETO
    @result = result
  end

  def as_json(options)
    super(:only => [:boleto_number])
  end
end
