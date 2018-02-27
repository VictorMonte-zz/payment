require_relative '../responses/credit_card_payment_response'

class CreditCardPaymentService
  def self.register(payment, buyer_id, client_id)
    #TODO: CardService
    card = Card
      .find_or_create_by(
        holder_name: payment[:card][:holder_name],
        number: payment[:card][:number],
        expiration_date: payment[:card][:expiration_date],
        cvv: payment[:card][:cvv],
        buyer_id: buyer_id
    )

    if card.valid?
      payment = CreditCardPayment
        .create(
          buyer_id: buyer_id, 
          card_id: card.id, 
          amount: payment[:amount], 
          client_id: client_id)
      CreditCardPaymentResponse.new(payment)
    else
      CreditCardPaymentReponse.new(card)
    end

  end
end
