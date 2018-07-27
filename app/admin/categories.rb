ActiveAdmin.register Category do
  index do
    selectable_column
    id_column
    column :name
    column :parent
    column :created_at
    column :description do |object|
      object.description.slice(0, 100) << '...'
    end
    actions
  end

  filter :parent
  filter :children
  filter :name
  filter :created_at
end
