class Course < ActiveRecord::Base
  belongs_to :user
  has_many :lectures, :dependent => :delete_all
end
