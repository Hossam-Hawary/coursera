ActiveAdmin.register User do
  permit_params :name,:email, :password, :password_confirmation,:gender,:birthdate,:profile_img

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :gender
    column :birthdate
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :name
  filter :gender
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :email
      f.input :gender
      f.input :birthdate
    end
    f.actions
  end
end