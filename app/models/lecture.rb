class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  mount_uploader :lec_file, LecFileUploader
  validate  :lec_file_size
  validates :course_id, :lec_file,:content,:presence => true
  validates_length_of :content, minimum: 20, too_short: 'Your Lecture must be at least 20 words.',tokenizer: ->(str) { str.scan(/\w+/) }
  acts_as_votable
  acts_as_commontable
  private
  def lec_file_size
    if lec_file.size > 5.megabytes
      errors.add(:lec_file, "should be less than 2MB")
    end
  end
end
