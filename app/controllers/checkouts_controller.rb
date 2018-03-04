class CheckoutsController < ApplicationController
  def new
    @checkout = Checkout.new
  end

  def create
    byebug
  end
end
