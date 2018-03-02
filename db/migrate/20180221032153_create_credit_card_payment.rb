class CreateCreditCardPayment < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_card_payments do |t|
      t.timestamp
    end
  end
end
