class AddBuyerIdToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :buyer_id, :integer
  end
end
