class AddBuyerIdToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :buyer_id, :integer
  end
end
