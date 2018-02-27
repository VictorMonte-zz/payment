require_relative "../services/payment_service"
require_relative "../responses/buyer_response"

class PaymentAggregate

  def initialize(params)
    @buyer = params[:buyer]
    @payment = params[:payment]
    @client_id = params[:client_id]
  end

  def register

    ActiveRecord::Base.transaction do
      #TODO: BuyerService
      buyer =  Buyer
        .create_with(name: @buyer[:name], email: @buyer[:email])
        .find_or_create_by(cpf: @buyer[:cpf])

      #TODO: ClientService
      client = Client.find_or_create_by(id: @client_id)

      if buyer.valid?
        PaymentService.new.register(@payment, buyer.id, client.id)
      else
        BuyerResponse.new(buyer) 
      end

    end

  end
end
