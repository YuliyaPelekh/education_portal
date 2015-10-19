class Image < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
end
