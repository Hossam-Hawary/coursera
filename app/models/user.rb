class User < ActiveRecord::Base
  mount_uploader :profile_img, PictureUploader

end
