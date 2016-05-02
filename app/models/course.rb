class Course < ActiveRecord::Base
  belongs_to :user
  has_many :lectures, :dependent => :delete_all
  validates :title, :presence => true
end
