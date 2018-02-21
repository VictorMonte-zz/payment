class CreateBuyers < ActiveRecord::Migration[5.1]
  def change
    create_table :buyers do |t|
      t.string :cpf, primary_key: true
      t.string :name
      t.string :email
      t.timestamps
    end
  end
end
