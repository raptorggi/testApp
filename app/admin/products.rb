ActiveAdmin.register Product do
  
  index do
    selectable_column
    id_column
    column :name_ru
    column :name_en
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

  filter :name_ru
  filter :name_en
  filter :quantity
  filter :reserved

end
