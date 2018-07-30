ActiveAdmin.register Category do
  index do
    selectable_column
    id_column
    column :name_ru
    column :name_en
    column :parent
    column :created_at
    column :description do |object|
      object.description.slice(0, 100) << '...'
    end
    actions
  end

  filter :parent
  filter :children
  filter :name_ru
  filter :name_en
  filter :created_at
end
