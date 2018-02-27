class AddClientIdToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :boleto_payments, :client_id, :integer
    add_column :credit_card_payments, :client_id, :integer
  end
end
