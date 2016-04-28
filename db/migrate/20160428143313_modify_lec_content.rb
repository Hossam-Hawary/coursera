class ModifyLecContent < ActiveRecord::Migration
  def change
    remove_column :lectures, :content ,:string
    add_column :lectures, :content ,:text
  end
end
