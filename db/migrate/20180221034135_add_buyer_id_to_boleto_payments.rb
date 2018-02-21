class AddBuyerIdToBoletoPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :boleto_payments, :buyer_id, :integer
  end
end
