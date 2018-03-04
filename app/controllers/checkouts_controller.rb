class CheckoutsController < ApplicationController
  def new
    @checkout = Checkout.new()
    @checkout.buyer ||= Buyer.new
  end

  def create
    byebug
  end
end
