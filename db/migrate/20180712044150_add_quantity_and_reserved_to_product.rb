class AddQuantityAndReservedToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :quantity, :integer
    add_column :products, :reserved, :integer
  end
end
