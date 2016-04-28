class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  mount_uploader :lec_file, LecFileUploader
  validate  :lec_file_size
  #validate  :user_id_current

  private
  def lec_file_size
    if lec_file.size > 5.megabytes
      errors.add(:lec_file, "should be less than 2MB")
    end
  end
  def user_id_current
    if user_id==current_user.id
      errors.add(:user_id, "not allowed !")
    end
  end
end
