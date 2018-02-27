require_relative '../aggregates/payment_aggregate'
require_relative '../enums/payment_method'

class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @response = PaymentAggregate.new(payment_order_params).register

    if !@response.result.valid?
      render status: :bad_request, json: @response.result.errors.full_messages
    else

      case @response.type
      when PaymentMethod::BOLETO
        render :json => @response.result.as_json(:only => [:boleto_number])
      when PaymentMethod::CREDITCARD
        head :ok
      else
        head :internal_server_error
      end

    end
  end

  private 

  def payment_order_params
    params
      .require(:payment_order)
      .permit(
        :client_id, 
        buyer: [:name, :email, :cpf], 
        payment: [:amount, :type, card: [:holder_name, :number, :expiration_date, :cvv]])
  end
end
