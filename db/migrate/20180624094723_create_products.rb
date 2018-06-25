class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
    	t.belongs_to :category
      t.string :name
      t.text :description
      t.integer :price
      t.string :slug
      t.timestamps
    end
  end
end
