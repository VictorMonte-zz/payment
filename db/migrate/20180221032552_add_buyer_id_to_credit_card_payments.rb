class AddBuyerIdToCreditCardPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :credit_card_payments, :buyer_id, :integer
  end
end
