class CheckoutsController < ApplicationController

  def new
    @checkout = Checkout.new
  end

  def create
    @response = perform_checkout.call

    if @response.result.valid?
      flash[:success] = "Your payment was create successfully! Here is your payement identitication #{@response.payment_hash}"
    else
      flash[:danger] = "Ops! Something is wrong with you checkout."
    end

    redirect_to action: "new"
  end

end

private

def perform_checkout
  perform_checkout ||= PerformCheckout.new(params, 1)
end
end
