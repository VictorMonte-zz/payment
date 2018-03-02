require_relative '../services/create_payment'
require_relative '../enums/payment_method'

class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @response = CreatePayment.new(payment_params).create

    if @response.result.valid?
      render :json => @response.as_json, status: :ok
    else
      render json: @response.result.errors.full_messages, status: :bad_request
    end
  end

  private 

  def payment_params
    params
      .require(:funding_instrument)
      .permit(
        client: [:id],
        buyer: [:cpf],
        payment: [:amount, :method, credit_card: [:id]])
  end
end
