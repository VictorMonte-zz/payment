class CreateCreditCardPayment < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_card_payments do |t|
      t.decimal :amount
      t.timestamp
    end
  end
end
