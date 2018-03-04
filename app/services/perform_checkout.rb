class PerformCheckout
  def initialize(params, client)
    @buyer = params.fetch(:buyer)
    @payment = params.fetch(:payment)
    @credit_card = params.fetch(:credit_card)
    @client = client
  end

  def call
    ActiveRecord::Base.transaction do

      @buyer = create_buyer.call

      case @payment[:method]
      when PaymentMethod::CREDITCARD
        perform_credit_card_operation
      when PaymentMethod::BOLETO
       create_boleto_payment 
      else
        raise 'Invalid Operation'
      end
    end
  end

  private

  def create_buyer
    create_buyer ||= CreateBuyer.new(@buyer.permit(:cpf, :name, :email))
  end

  def create_credit_card
    create_credit_card ||= CreateCreditCard.new(@credit_card.permit(:holder_name, :number, :expiration_date, :cvv), @buyer.cpf)
  end

  def create_credit_card_payment
    create_credit_card_payment ||= CreatePayment.new({
      :buyer => @buyer,
      :client => { id: @client},
      :payment => { amount: @payment[:amount], method: @payment[:method], :credit_card => { id: @credit_card.id  }  }
    })
  end

  def perform_credit_card_operation

    @credit_card = create_credit_card.call

    if @credit_card.valid?
      create_credit_card_payment.call
    else
      raise 'Fail to register credit card'
    end

  end

  def create_boleto_payment
    create_boleto_payment ||= CreatePayment.new({
      :buyer => @buyer,
      :client => { id: @client},
      :payment => { amount: @payment[:amount], method: @payment[:method] }
    })  
  end
end
