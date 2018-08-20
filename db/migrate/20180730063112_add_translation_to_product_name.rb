class AddTranslationToProductName < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :name
    add_column :products, :name_ru, :string
    add_column :products, :name_en, :string
  end
end
