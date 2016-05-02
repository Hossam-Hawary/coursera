class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :profile_img, PictureUploader
  has_many :lectures, :dependent => :delete_all
  has_many :courses, :dependent => :delete_all
  validate :profile_img_size
  validates :name,:password_confirmation,:gender,:presence => true
  validates :name,:uniqueness => true
  validates_confirmation_of :password
  validates_inclusion_of :gender, in: %w( male female )
  validates_length_of :name, within: 3..15, too_long: 'pick a shorter name', too_short: 'pick a longer name'
  acts_as_voter
  acts_as_commontator
  private

  # Validates the size of an uploaded picture.
  def profile_img_size
    if profile_img.size > 2.megabytes
      errors.add(:profile_img, "should be less than 2MB")
    end
  end

end
