class AddPaymentIdToCreditAndBoletoPayment < ActiveRecord::Migration[5.1]
  def change
    add_reference :boleto_payments, :payment, foreign_key: true
    add_reference :credit_card_payments, :payment, foreign_key: true
  end
end
