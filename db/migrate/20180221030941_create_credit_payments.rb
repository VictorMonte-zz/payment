class CreateCreditPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_payments do |t|
      t.decimal :amount
      t.timestamp
    end
  end
end
