class CreateBoletoPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :boleto_payments do |t|
      t.decimal :amount
      t.string :boleto_number
      t.timestamp
    end
  end
end
