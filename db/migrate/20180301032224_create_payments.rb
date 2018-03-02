class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.text :payment_hash, unique: true
      t.integer :status
      t.decimal :amount
    end
  end
end
