class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :profile_img, PictureUploader
  has_many :lectures, :dependent => :delete_all
  has_many :courses, :dependent => :delete_all
  validate  :profile_img_size
  validates :name, :presence => true
  validates :name,:uniqueness => true
  acts_as_voter
  private

  # Validates the size of an uploaded picture.
  def profile_img_size
    if profile_img.size > 2.megabytes
      errors.add(:profile_img, "should be less than 2MB")
    end
  end

end
