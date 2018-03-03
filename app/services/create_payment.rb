require_relative "../enums/payment_method"
require_relative "../enums/payment_status"
require "create_credit_card_payment_info"
require "create_boleto_payment_info"
require "generate_payment_hash"

class CreatePayment

  def initialize(params)

    @buyer = Buyer.where(cpf: params[:buyer][:cpf]).first

    @client_id = params[:client][:id]
    @method = params[:payment][:method]

    if !params[:payment][:credit_card].blank?
      @card_id = params[:payment][:credit_card][:id]
    end

    @payment =
      Payment.new(
        status: PaymentStatus::CREATED,
        amount: params[:payment][:amount],
        client_id: params[:client][:id],
        buyer_id: @buyer.id,
        method: @method
    )


  end

  def call
    ActiveRecord::Base.transaction do
      @payment.payment_hash = generate_payment_hash.call
      @payment.buyer_id = @buyer.id

        if @payment.save

          case @method
          when PaymentMethod::CREDITCARD
            create_credit_card_payment_info.call
          when PaymentMethod::BOLETO
            create_boleto_payment_info.call
          end

        end
    end
  end

  private

  attr_reader :payment
  attr_reader :card_id

  def create_credit_card_payment_info
    @create_credit_card_payment_info ||= CreateCreditCardPaymentInfo.new(payment, card_id)
  end

  def create_boleto_payment_info
    @create_boleto_payment_info ||= CreateBoletoPaymentInfo.new(payment)
  end

  def generate_payment_hash
    @generate_payment_hash ||= GeneratePaymentHash.new(@buyer_id, payment.amount)
  end
 
end
