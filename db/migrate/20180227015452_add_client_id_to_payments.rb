class AddClientIdToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :client_id, :integer
  end
end
