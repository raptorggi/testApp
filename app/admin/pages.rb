ActiveAdmin.register Page do
  index do
    selectable_column
    column :title
    column :text do |object|
      object.text.slice(0, 200) << '...'
    end
    actions
  end

  filter :title
end
