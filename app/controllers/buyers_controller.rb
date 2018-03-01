require_relative '../services/buyer_service'

class BuyersController < ApplicationController
  skip_before_action :verify_authenticity_token
 
 def create
   @buyer =  BuyerService.new(buyer_params).create

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
end
