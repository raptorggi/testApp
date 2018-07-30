class AddTranslationToCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :name
    add_column :categories, :name_ru, :string
    add_column :categories, :name_en, :string
  end
end
