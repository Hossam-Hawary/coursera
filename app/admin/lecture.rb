ActiveAdmin.register Lecture do
  permit_params :title

  index do
    selectable_column
    id_column
    column :lec_file
    column :course_id
    column :user_id
    column :created_at
    column :updated_at
    actions
  end

  filter :user_id
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :content
      f.input :lec_file
      f.input :course_id
    end
    f.actions
  end

end