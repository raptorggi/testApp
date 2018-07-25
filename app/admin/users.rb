ActiveAdmin.register User do
  permit_params :name, :second_name, :email, :phone, :current_sign_in_at

  index do
    selectable_column
    id_column
    column :name
    column :second_name
    column :email
    column :phone
    column :current_sign_in_at
    actions
  end

end
