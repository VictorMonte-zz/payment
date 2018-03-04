require_relative '../services/create_buyer'

class BuyersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @buyer = create_buyer.call

    if @buyer.valid?
      head :ok
    else
      render json: @buyer.errors.full_messages, status: :bad_request
    end
  end

  private

  def buyer_params
    params.require(:buyer).permit(:name, :cpf, :email)
  end

  def create_buyer
    create_buyer ||= CreateBuyer.new(buyer_params)
  end
end
