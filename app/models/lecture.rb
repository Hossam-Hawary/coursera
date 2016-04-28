class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  mount_uploader :lec_file, LecFileUploader
  validate  :lec_file_size
  validates :course_id, :presence => true

  private
  def lec_file_size
    if lec_file.size > 5.megabytes
      errors.add(:lec_file, "should be less than 2MB")
    end
  end
end
