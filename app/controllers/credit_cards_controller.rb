require_relative '../services/credit_card_service'

class CreditCardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @card = CreditCardService.new(credit_card_params).create(params[:cpf])
    if @card.valid?
      head :ok
    else
      render json: @card.errors.full_messages, status: :bad_request
    end
  end

  private

  def credit_card_params
    params.require(:cpf)
    params.require(:card).permit(:holder_name, :number, :expiration_date, :cvv)
  end
end
