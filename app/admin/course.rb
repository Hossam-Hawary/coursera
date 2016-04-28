ActiveAdmin.register Course do
  permit_params :title

  index do
    selectable_column
    id_column
    column :title
    column :user_id
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :user_id
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :title
    end
    f.actions
  end

end
