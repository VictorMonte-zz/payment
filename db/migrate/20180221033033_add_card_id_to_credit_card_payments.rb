class AddCardIdToCreditCardPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :credit_card_payment, :card_id, :integer
  end
end
