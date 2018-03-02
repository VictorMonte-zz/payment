require_relative '../services/create_credit_card'

class CreditCardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @card = create_credit_card.call

    if !@card.valid?
      render json: @card.errors.full_messages, status: :bad_request
    end

    render json: @card.id, head: :ok

  end

  private

  def credit_card_params
    params.require(:cpf)
    params.require(:card).permit(:holder_name, :number, :expiration_date, :cvv)
  end

  def create_credit_card
    create_credit_card ||= CreateCreditCard.new(credit_card_params, params[:cpf])
  end
end
