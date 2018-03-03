require_relative '../enums/payment_method'

class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @response = create_payment.call

    if @response.result.valid?
      render :json => @response.as_json, status: :ok
    else
      render json: @response.result.errors.full_messages, status: :bad_request
    end
  end


  def status
    @response = get_status_payment.call

    if @response.payment.valid?
        render json: @response.as_json, status: :ok
    else
      head status: :not_found
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

  def get_payment_params
    params.require(:hash)
  end

  def create_payment
    create_payment ||= CreatePayment.new(payment_params)
  end

  def get_status_payment
    get_status_payment ||= GetStatusPayment.new(get_payment_params)
  end

end
