ActiveAdmin.register Product do
  
  index do
    selectable_column
    id_column
    column :name
    column 'Left' do |object|
      object.left
    end
    column :quantity
    column :reserved
    column :description do |object|
      object.description.slice(0, 100) << '...'
    end
    column 'Image' do |object|
      image_tag object.image.url(:small)
    end
    actions
  end

  filter :name
  filter :quantity
  filter :reserved

end
