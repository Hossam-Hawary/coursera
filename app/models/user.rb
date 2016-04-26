class User < ActiveRecord::Base
  mount_uploader :profile_img, PictureUploader
  validate  :profile_img_size
  validates :name, :presence => true
  validates :name,:uniqueness => true

  private

  # Validates the size of an uploaded picture.
  def profile_img_size
    if profile_img.size > 2.megabytes
      errors.add(:profile_img, "should be less than 2MB")
    end
  end

end
