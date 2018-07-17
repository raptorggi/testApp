class CreateUserCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_carts do |t|
      t.belongs_to :user
      t.belongs_to :product
      t.string :user_token
      t.integer :quantity

      t.timestamps
    end
  end
end
