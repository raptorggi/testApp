ActiveAdmin.register Order do
  actions :show, :edit, :delete, :index

  index do
    selectable_column
    id_column
    column :user
    column :address
    column :created_at
    actions
  end

  filter :user
  filter :products
  filter :address
  filter :created_at

end
