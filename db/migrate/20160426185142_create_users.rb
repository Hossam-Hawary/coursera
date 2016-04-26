class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.date :birthdate
      t.string :profile_img

      t.timestamps null: false
    end
  end
end
