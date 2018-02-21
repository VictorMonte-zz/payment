class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :holdername
      t.integer :number
      t.date :expirationDate
      t.integer :cvv
    end
  end
end
