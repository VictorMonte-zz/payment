require_relative '../responses/boleto_payment_response'

class BoletoPaymentService

  def self.register(payment, buyer_id, client_id)
    payment =  BoletoPayment
      .create(
        buyer_id: buyer_id, 
        amount: payment[:amount], 
        boleto_number: "123456478765145",
        client_id: client_id
    )
    BoletoPaymentResponse.new(payment)
  end
end
