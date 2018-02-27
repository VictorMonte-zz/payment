class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :holder_name
      t.string :number
      t.date :expiration_date
      t.integer :cvv
    end
  end
end
