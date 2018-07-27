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

  filter :name, label: 'First name'
  filter :second_name, label: 'Second name'
  filter :email, label: 'E-mail'
  filter :phone
end
