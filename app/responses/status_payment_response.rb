require_relative "../enums/payment_method"

class StatusPaymentResponse
  attr_reader :payment
  attr_reader :info

  def initialize(payment, info)
    @payment = payment
    @info = info
  end

  def as_json
    case @payment.method
    when PaymentMethod::CREDITCARD
      create_credit_card_json
    when PaymentMethod::BOLETO
      create_boleto_json
    else
      "Payment method not specified"
    end
  end

  private

  def create_credit_card_json
    { 
      :amount => @payment.amount, 
      :status => @payment.status, 
      :card => { 
        :number => @info.number
      } 
    }
  end
  
  def create_boleto_json
    {
      :amount => @payment.amount,
      :status => @payment.status,
      :boleto => @info.boleto_number
    }
  end
end
